class AddComplaintsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :complaints, :boolean
  end
end
