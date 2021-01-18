issues = Complaint.where("created_at < '2021-01-03 23:59:59'")
issues.each do |i|
  i.status = 'CLOSED'
  i.save(:validate => false)
  parts = i.complaint_parts
  parts.each do |p|
    p.part_status = 'CLOSED'
    p.save(:validate => false)
  end
end
