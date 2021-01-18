class ComplaintsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]
  before_action :set_user #, except: [:api, :customer]
  before_action :build_lists, only: [:new, :create, :edit, :update]
  before_action :set_image, only: [:showimage]

  # GET /complaints
  def index
    if !user_signed_in? || !current_user.complaints
      redirect_to signout_path and return
    end
    if current_user.complaints_role == 'Admin'
      @complaints = Complaint.all
    else
      if current_user.complaints_role == 'Quality'
        @complaints = Complaint.where.not(status: 'CLOSED')
      else
        if current_user.complaints_role == 'Sales'
          # include all issues created for this user by others
          own_complaints = Complaint.where(user: @user)
          add_complaints = Complaint.where(rep_name: @user)
          @complaints = own_complaints + add_complaints
        else
          @complaints = Complaint.where(user: @user)
        end
      end
    end
  end

  # GET /complaints_closedlist
  def closedlist
    @complaints = Complaint.where(status: 'CLOSED')
  end

  # GET /complaints/1
  def show
  end

  def source
  end

  # GET /complaints/new
  def new
    if params[:invoice].blank? && params[:order].blank? && params[:lot_numb].blank? && params[:po_number].blank?
      redirect_to complaints_source_path, notice: 'Enter data' and return
    end
    i = 0
    if !params[:invoice].blank?
      i += 1
    end
    if !params[:order].blank?
      i += 1
    end
    if !params[:lot_numb].blank?
      i += 1
    end
    if !params[:po_number].blank?
      i += 1
    end
    if i > 1
      redirect_to complaints_source_path, notice: 'Enter only one field' and return
    end
    session[:lot] = ''
    $po = ''
    dc = 'NJ'
    if !params[:invoice].blank?
      @complaint = Complaint.find_by user:@user, invoice: params[:invoice]
      if @complaint
        # if complaint already exists go to edit
        redirect_to edit_complaint_path(@complaint) and return
      end
      @items = Invitem.where(invoice_numb: params[:invoice])
      if @items.length == 0
        # no data for invoice entered go back to source
        redirect_to complaints_source_path, notice: 'Invoice not found' and return
      else
        invitem = @items.first
        o = Ordhead.find_by order_numb: invitem.order_numb
        session[:customer_code] = o.cust_code
        session[:invoice] = invitem.invoice_numb
        session[:order] = invitem.order_numb
        dc = invitem.cost_ctr
      end
    elsif !params[:order].blank?
      @complaint = Complaint.find_by user:@user, order: params[:order]
      if @complaint
        # if complaint already exists go to edit
        redirect_to edit_complaint_path(@complaint) and return
      end
      @items = Invitem.where(order_numb: params[:order])
      if @items.length == 0
        # no data for order entered go back to source
        redirect_to complaints_source_path, notice: 'Order not found' and return
      else
        invitem = @items.first
        o = Ordhead.find_by order_numb: invitem.order_numb
        session[:customer_code] = o.cust_code
        session[:invoice] = invitem.invoice_numb
        session[:order] = invitem.order_numb
        dc = invitem.cost_ctr
      end
    elsif !params[:lot_numb].blank?
      @complaint = Complaint.find_by user:@user, lot: params[:lot_numb]
      if @complaint
        # if complaint already exists go to edit
        redirect_to edit_complaint_path(@complaint) and return
      end
      vendloth = Vendloth.find_by(lot: params[:lot_numb])
      if !vendloth
        # not a valid lot
        redirect_to complaints_source_path, notice: 'Lot not found' and return
      else
        session[:customer_code] = ''
        session[:invoice] = ''
        session[:order] = ''
        session[:lot] = params[:lot_numb]
      end
    else
      # must be PO number
      @complaint = Complaint.find_by user:@user, po_number: params[:po_number]
      if @complaint
        # if complaint already exists go to edit
        redirect_to edit_complaint_path(@complaint) and return
      end
      pohead = Pohead.find_by(po_number: params[:po_number])
      if !pohead
        # not a valid lot
        redirect_to complaints_source_path, notice: 'PO not found' and return
      else
        session[:customer_code] = ''
        session[:invoice] = ''
        session[:order] = ''
        $po = params[:po_number]
      end
    end

    @complaint = Complaint.new(user:@user, invoice: session[:invoice], order: session[:order], lot: session[:lot], po_number: $po, dc: dc, customer_code: session[:customer_code], status: 'OPEN')
    if !vendloth.blank?
      # Lots have only 1 part. Need to get the lot qty and part details
      part = Partmstr.find_by part_code: vendloth.part_code
      lotd = Vendlotd.find_by lot: vendloth.lot
      @complaint.complaint_parts.build part_code: vendloth.part_code, part_desc: part.part_desc, uom: part.uom, invoice_qty: lotd.qty, lot_numb:lotd.lot, lot_expiry_date: vendloth.expire_date
    elsif !pohead.blank?
      # use poitem table to get part list
      @poitems = Poitem.where(po_number: params[:po_number])
      @poitems.each do |i|
        @complaint.complaint_parts.build part_code: i.part_code, part_desc: i.part_desc, uom: i.uom, invoice_qty: i.qty_ordered
      end
    else
      @items.each do |i|
        loth = Vendloth.find_by lot: i.lot
        @complaint.complaint_parts.build part_code: i.part_code, part_desc: i.part_desc, uom: i.uom, invoice_qty: i.qty, lot_numb: i.lot, lot_expiry_date: loth.expire_date
      end
    end
    4.times { @complaint.complaint_images.build }

  end

  # GET /complaints/1/edit
  def edit
    @edit = true
    @complaint.complaint_images.build
  end

  # POST /complaints
  def create
    cp = complaint_params
    if $error && $complaint_images_attributes
      cp[:complaint_images_attributes] = $complaint_images_attributes
    end
    if ['Quality', 'Admin', 'Sales'].include?(current_user.complaints_role) && !cp[:rep_name].blank?
      #  make sure rep name and rep id stay in sync
      i = @rep_names.index(cp[:rep_name])
      cp[:rep_id] = @rep_ids[i]
    end
    @complaint = Complaint.new(cp)
    # add an image record if there are none
    if @complaint.complaint_images.length == 0
      @complaint.complaint_images.build
    end

    respond_to do |format|
      if @complaint.save
        $error = false
        format.html { redirect_to @complaint, notice: 'Complaint was successfully created.' }
      else
        $error = true
        $complaint_images_attributes = cp[:complaint_images_attributes]
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /complaints/1
  def update
    cp = complaint_params
    if $error && $complaint_images_attributes
      cp[:complaint_images_attributes] = $complaint_images_attributes
    end
    if ['Quality', 'Admin', 'Sales'].include?(current_user.complaints_role)
      #  make sure rep name and rep id stay in sync
      if !cp[:rep_name].blank?
        i = @rep_names.index(cp[:rep_name])
        cp[:rep_id] = @rep_ids[i]
      else
        cp[:rep_id] = ''
      end
    end
    respond_to do |format|
      if @complaint.update(cp)
        $error = false
        format.html { redirect_to @complaint, notice: 'Complaint was successfully updated.' }
      else
        $error = true
        $complaint_images_attributes = cp[:complaint_images_attributes]
        format.html { render :edit }
      end
    end
  end

  # DELETE /complaints/1
  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url, notice: 'Complaint was successfully deleted.' }
    end
  end

  def closed
    i = 0
    complaint_count = Complaint.where.not(status: 'CLOSED').length
    while i < complaint_count
      i += 1
      closedi = 'closed'+i.to_s
      if params[closedi] == '1'
        # check box selected
        idi = 'id'+i.to_s
        complaint = Complaint.find_by id: params[idi]
        complaint.status = 'CLOSED'
        complaint.qa_notes = 'This issue has been closed as does not meet action thresholds'
        parts = complaint.complaint_parts
        parts.each do |p|
          p.part_status = 'CLOSED'
          p.save
        end
        complaint.save
      end
    end
    redirect_to complaints_path, notice: 'Complaints were successfully closed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    def set_user
      e = Employee.find_by Badge_: current_user.badge_numb
      if e && e.Employee_Name
        @user = e.Employee_Name
      else
        @user = current_user.badge_numb
      end
    end

    def set_image
      @complaint_image = ComplaintImage.find(params[:id])
      @complaint = Complaint.find(@complaint_image.complaint_id)
    end

    def build_lists
      @issue = ['BUTCHERING', 'FLAVOR', 'FOREIGN MATERIAL', 'HANDLING (BRUISING)', 'PACKAGING LOOSE/BLOWN/DAMAGED', 'PRODUCT SPEC', 'SHELF LIFE/SPOILAGE', 'TEMPERATURE', 'WRONG ITEM (LABELING)']
      @status = ['OPEN', 'CLOSED', 'PENDING']
      @date_today = Date.today
      if ['Quality', 'Admin', 'Sales'].include?(current_user.complaints_role)
        # Build a list of Sales users
        @rep_names = Rails.cache.read('Repnames')
        if !@rep_names
          # create a list of sales rep names for view and store in cache memory
          rep_ids = []
          sales_reps = User.where(complaints_role: "Sales")
          sales_reps.each do |s|
            e = Employee.find_by Badge_: s.badge_numb
            if e && e.Employee_Name
              rep_ids.push(e.Employee_Name + "$" + s.badge_numb)
            end
          end
          rep_ids.sort!
          @rep_names = []
          @rep_ids = []
          rep_ids.each do |r|
            array = r.split("$")
            @rep_names.push(array[0])
            @rep_ids.push(array[1])
          end
          Rails.cache.write('Repnames', @rep_names)
          Rails.cache.write('Repids', @rep_ids)
        else
          @rep_ids = Rails.cache.read('Repids')
        end

      end
    end

    # Only allow a list of trusted parameters through.
    def complaint_params
      params.require(:complaint).permit(:user, :invoice, :order, :issue_date, :notes, :qa_notes, :status, :with_vendor, :dc, :customer_code, :lot, :po_number, :rep_id, :rep_name,
        complaint_parts_attributes: [
          :id,
          :part_code,
          :part_desc,
          :uom,
          :invoice_qty,
          :issue1,
          :issue1_description,
          :issue2,
          :issue2_description,
          :qty,
          :each_check,
          :lot_numb,
          :lot_expiry_date,
          :part_status
        ],
        complaint_images_attributes: [
          :id,
          :image
        ]
      )
    end
end
