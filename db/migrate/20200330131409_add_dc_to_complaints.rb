class AddDcToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :dc, :string
  end
end
