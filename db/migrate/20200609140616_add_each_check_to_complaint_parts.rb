class AddEachCheckToComplaintParts < ActiveRecord::Migration[5.1]
  def change
    add_column :complaint_parts, :each_check, :boolean
  end
end
