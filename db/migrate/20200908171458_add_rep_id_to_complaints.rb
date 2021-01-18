class AddRepIdToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :rep_id, :string
  end
end
