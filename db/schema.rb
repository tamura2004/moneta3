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

ActiveRecord::Schema.define(version: 2023_07_28_063317) do

  create_table "accounts", force: :cascade do |t|
    t.string "number", null: false
    t.integer "amount", default: 0
    t.date "start_date"
    t.date "end_date"
    t.integer "product_id"
    t.integer "branch_id"
    t.integer "user_id"
    t.integer "account_id"
    t.integer "currency_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_accounts_on_account_id"
    t.index ["branch_id"], name: "index_accounts_on_branch_id"
    t.index ["currency_id"], name: "index_accounts_on_currency_id"
    t.index ["product_id"], name: "index_accounts_on_product_id"
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

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "rate_max"
    t.float "rate_min"
    t.string "symbol"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string "name"
    t.string "memo"
    t.integer "user_id", null: false
    t.integer "state_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_issues_on_state_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
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

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "rate"
    t.integer "minus_limit", default: 0
    t.boolean "is_debit", default: false
    t.boolean "is_fixed", default: false
    t.boolean "is_credit", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer "currency_id", null: false
    t.float "rate"
    t.datetime "changed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_rates_on_currency_id"
  end

  create_table "statements", force: :cascade do |t|
    t.integer "amount", null: false
    t.text "memo"
    t.integer "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_statements_on_account_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "id_name"
    t.string "name"
    t.string "kana_name"
    t.integer "masked_password"
    t.integer "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_users_on_account_id"
  end

  add_foreign_key "branches", "banks"
  add_foreign_key "issues", "states"
  add_foreign_key "issues", "users"
  add_foreign_key "pages", "pages"
  add_foreign_key "rates", "currencies"
  add_foreign_key "statements", "accounts"
  add_foreign_key "users", "accounts"
end
