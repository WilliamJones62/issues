class AddComplaintsDcToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :complaints_dc, :string
  end
end
