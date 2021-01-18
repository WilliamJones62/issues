class CreateComplaintImages < ActiveRecord::Migration[5.1]
  def change
    create_table :complaint_images do |t|
      t.integer :complaint_id
      t.string :image

      t.timestamps
    end
  end
end
