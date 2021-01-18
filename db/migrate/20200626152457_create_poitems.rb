class CreatePoitems < ActiveRecord::Migration[5.1]
  def change
    create_table :poitems do |t|
      t.string :po_number
      t.string :part_code
      t.string :part_desc
      t.float :qty_ordered

      t.timestamps
    end
  end
end
