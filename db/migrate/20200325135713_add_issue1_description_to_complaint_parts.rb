class AddIssue1DescriptionToComplaintParts < ActiveRecord::Migration[5.1]
  def change
    add_column :complaint_parts, :issue1_description, :text
  end
end
