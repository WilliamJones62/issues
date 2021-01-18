class AddPartStatusToComplaintParts < ActiveRecord::Migration[5.1]
  def change
    add_column :complaint_parts, :part_status, :string
  end
end
