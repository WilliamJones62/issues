class AddActionTakenToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :action_taken, :string
  end
end
