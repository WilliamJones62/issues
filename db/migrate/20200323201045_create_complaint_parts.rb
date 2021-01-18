class CreateComplaintParts < ActiveRecord::Migration[5.1]
  def change
    create_table :complaint_parts do |t|
      t.integer :complaint_id
      t.string :part_code
      t.string :part_desc
      t.string :uom
      t.decimal :qty
      t.decimal :invoice_qty
      t.string :issue1
      t.string :issue2

      t.timestamps
    end
  end
end
