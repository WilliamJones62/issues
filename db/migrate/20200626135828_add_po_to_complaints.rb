class AddPoToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :po, :string
  end
end
