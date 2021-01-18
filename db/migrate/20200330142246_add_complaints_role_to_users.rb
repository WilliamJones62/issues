class AddComplaintsRoleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :complaints_role, :string
  end
end
