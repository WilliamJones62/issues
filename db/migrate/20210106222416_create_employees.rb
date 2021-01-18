class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :Badge_
      t.string :string
      t.string :Employee_Name
      t.string :string
      t.string :Badge_No

      t.timestamps
    end
  end
end
