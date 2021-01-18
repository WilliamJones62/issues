class ComplaintImage < ApplicationRecord
  self.table_name = "qa_issue_images"
  mount_uploader :image, ImageUploader
  belongs_to :complaint, :foreign_key => "complaint_id"
end
