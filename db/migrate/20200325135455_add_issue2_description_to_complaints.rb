class AddIssue2DescriptionToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :issue2_description, :text
  end
end
