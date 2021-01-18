class CreateInvitems < ActiveRecord::Migration[5.1]
  def change
    create_table :invitems do |t|
      t.string :invoice_numb
      t.string :part_code
      t.string :part_desc
      t.decimal :qty
      t.string :uom
      t.string :order_numb
      t.string :lot

      t.timestamps
    end
  end
end
