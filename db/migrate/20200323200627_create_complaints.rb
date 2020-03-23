class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints do |t|
      t.string :user
      t.string :invoice
      t.string :order
      t.string :lot
      t.date :issue_date
      t.text :notes
      t.string :status
      t.boolean :with_vendor

      t.timestamps
    end
  end
end
