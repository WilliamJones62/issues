class AddCustomerCodeToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :customer_code, :string
  end
end
