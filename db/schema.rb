# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20210105172832) do

  create_table "complaint_images", force: :cascade do |t|
    t.integer "complaint_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complaint_parts", force: :cascade do |t|
    t.integer "complaint_id"
    t.string "part_code"
    t.string "part_desc"
    t.string "uom"
    t.decimal "qty"
    t.decimal "invoice_qty"
    t.string "issue1"
    t.string "issue2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "issue1_description"
    t.text "issue2_description"
    t.boolean "each_check"
    t.string "lot_numb"
    t.date "lot_expiry_date"
    t.string "part_status"
  end

  create_table "complaints", force: :cascade do |t|
    t.string "user"
    t.string "invoice"
    t.string "order"
    t.string "lot"
    t.date "issue_date"
    t.text "notes"
    t.string "status"
    t.boolean "with_vendor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "issue1_description"
    t.text "issue2_description"
    t.string "dc"
    t.string "customer_code"
    t.string "action_taken"
    t.string "vendor_code"
    t.string "po_number"
    t.date "vendor_issue_date"
    t.string "po"
    t.string "rep_name"
    t.string "rep_id"
  end

  create_table "employee_lists", force: :cascade do |t|
    t.string "Badge_"
    t.string "Employee_Name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Badge_No"
  end

  create_table "invitems", force: :cascade do |t|
    t.string "invoice_numb"
    t.string "part_code"
    t.string "part_desc"
    t.decimal "qty"
    t.string "uom"
    t.string "order_numb"
    t.string "lot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordheads", force: :cascade do |t|
    t.string "order_numb"
    t.string "rel_numb"
    t.string "cust_code"
    t.string "cust_name"
    t.string "cust_po"
    t.string "return_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orditems", force: :cascade do |t|
    t.string "order_numb"
    t.string "part_code"
    t.string "part_desc"
    t.decimal "qty"
    t.string "uom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partmstrs", force: :cascade do |t|
    t.string "part_code"
    t.string "part_desc"
    t.string "uom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "poheads", force: :cascade do |t|
    t.string "po_number"
    t.string "vend_code"
    t.string "vend_name"
    t.string "reject_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "poitems", force: :cascade do |t|
    t.string "po_number"
    t.string "part_code"
    t.string "part_desc"
    t.float "qty_ordered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uom"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "complaints"
    t.string "complaints_role"
    t.string "complaints_dc"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendlotds", force: :cascade do |t|
    t.string "part_code"
    t.string "lot"
    t.decimal "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendloths", force: :cascade do |t|
    t.string "part_code"
    t.string "lot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "expire_date"
  end

end
