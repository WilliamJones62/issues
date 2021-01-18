class AddPoNumberToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :po_number, :string
  end
end
