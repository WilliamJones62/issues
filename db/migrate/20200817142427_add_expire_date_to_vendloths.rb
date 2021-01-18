class AddExpireDateToVendloths < ActiveRecord::Migration[5.1]
  def change
    add_column :vendloths, :expire_date, :date
  end
end
