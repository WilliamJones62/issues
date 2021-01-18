class AddUomToPoitems < ActiveRecord::Migration[5.1]
  def change
    add_column :poitems, :uom, :string
  end
end
