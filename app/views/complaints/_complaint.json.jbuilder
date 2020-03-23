json.extract! complaint, :id, :user, :invoice, :order, :lot, :issue_date, :notes, :status, :with_vendor, :created_at, :updated_at
json.url complaint_url(complaint, format: :json)
