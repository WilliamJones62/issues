class AddLotNumbToComplaintParts < ActiveRecord::Migration[5.1]
  def change
    add_column :complaint_parts, :lot_numb, :string
  end
end
