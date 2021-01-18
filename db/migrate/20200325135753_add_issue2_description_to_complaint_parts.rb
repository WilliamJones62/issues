class AddIssue2DescriptionToComplaintParts < ActiveRecord::Migration[5.1]
  def change
    add_column :complaint_parts, :issue2_description, :text
  end
end
