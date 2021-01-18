class AddVendorCodeToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :vendor_code, :string
  end
end
