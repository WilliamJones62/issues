class AddVendorIssueDateToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :vendor_issue_date, :date
  end
end
