class CreateVendloths < ActiveRecord::Migration[5.1]
  def change
    create_table :vendloths do |t|
      t.string :part_code
      t.string :lot

      t.timestamps
    end
  end
end
