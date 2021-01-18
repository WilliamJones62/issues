class CreateVendlotds < ActiveRecord::Migration[5.1]
  def change
    create_table :vendlotds do |t|
      t.string :part_code
      t.string :lot
      t.decimal :qty

      t.timestamps
    end
  end
end
