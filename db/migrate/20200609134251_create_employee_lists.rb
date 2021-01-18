class CreateEmployeeLists < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_lists do |t|
      t.string :Badge_
      t.string :Employee_Name

      t.timestamps
    end
  end
end
