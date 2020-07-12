# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_12_092131) do

  create_table "accounts", force: :cascade do |t|
    t.string "user_id_name", null: false
    t.string "name", null: false
    t.integer "amount", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "branch_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id"], name: "index_accounts_on_branch_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "banks", force: :cascade do |t|
    t.integer "number", null: false
    t.string "name", null: false
    t.string "kana_name"
    t.boolean "myself", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "branches", force: :cascade do |t|
    t.integer "number", null: false
    t.string "name", null: false
    t.string "kana_name"
    t.integer "bank_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bank_id"], name: "index_branches_on_bank_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "path"
    t.integer "page_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["page_id"], name: "index_pages_on_page_id"
  end

  create_table "statements", force: :cascade do |t|
    t.string "user_id_name", null: false
    t.string "instrument_name", null: false
    t.integer "amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "id_name"
    t.string "name"
    t.string "kana_name"
    t.integer "masked_password"
    t.string "credit_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "branches", "banks"
  add_foreign_key "pages", "pages"
end
