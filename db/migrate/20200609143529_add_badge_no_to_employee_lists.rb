class AddBadgeNoToEmployeeLists < ActiveRecord::Migration[5.1]
  def change
    add_column :employee_lists, :Badge_No, :string
  end
end
