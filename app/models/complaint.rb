class Complaint < ApplicationRecord
  self.table_name = "qa_issues"
  has_many :complaint_parts, inverse_of: :complaint, :dependent => :destroy
  accepts_nested_attributes_for :complaint_parts, reject_if: proc { |attributes| attributes['part_code'].blank? }
  has_many :complaint_images, inverse_of: :complaint, :dependent => :destroy
  accepts_nested_attributes_for :complaint_images, reject_if: proc { |attributes| attributes['image'].blank? }
  validates_presence_of :issue_date
  validate :part_must_be_present

  def part_must_be_present
    if !errors.any?
      errors.add(:lot, "issue must have at least 1 part") if complaint_parts.reject(&:marked_for_destruction?).size < 1
    end
  end

end
