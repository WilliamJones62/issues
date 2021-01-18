class AddRepNameToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :rep_name, :string
  end
end
