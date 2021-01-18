class AddIssue1DescriptionToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :issue1_description, :text
  end
end
