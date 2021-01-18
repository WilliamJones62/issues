class CreatePoheads < ActiveRecord::Migration[5.1]
  def change
    create_table :poheads do |t|
      t.string :po_number
      t.string :vend_code
      t.string :vend_name
      t.string :reject_reason

      t.timestamps
    end
  end
end
