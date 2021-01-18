class AddLotExpiryDateToComplaintParts < ActiveRecord::Migration[5.1]
  def change
    add_column :complaint_parts, :lot_expiry_date, :date
  end
end
