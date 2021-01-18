class ComplaintPart < ApplicationRecord
  self.table_name = "qa_issue_parts"
  belongs_to :complaint, :foreign_key => "complaint_id"
  # validate :qty

  # def qty
  #   if !qty.blank? && qty > invoice_qty
  #     errors.add(:qty, "cannot be greater than original qty.")
  #   end
  # end
end
