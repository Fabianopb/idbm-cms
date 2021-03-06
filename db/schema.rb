# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160903111949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "social_security"
    t.string   "phone_number"
    t.string   "iban"
    t.string   "swift"
    t.string   "address"
    t.string   "postal_code"
    t.string   "city"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.date     "birth_date"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "daily_allowances", force: :cascade do |t|
    t.integer  "refund_claim_id"
    t.datetime "arrival"
    t.string   "destination"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  add_index "daily_allowances", ["refund_claim_id"], name: "index_daily_allowances_on_refund_claim_id", using: :btree
  add_index "daily_allowances", ["user_id"], name: "index_daily_allowances_on_user_id", using: :btree

  create_table "faqs", force: :cascade do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
  end

  create_table "km_allowances", force: :cascade do |t|
    t.integer  "refund_claim_id"
    t.date     "date"
    t.string   "route"
    t.decimal  "kms"
    t.string   "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  add_index "km_allowances", ["refund_claim_id"], name: "index_km_allowances_on_refund_claim_id", using: :btree
  add_index "km_allowances", ["user_id"], name: "index_km_allowances_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "project_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "projects_users", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "projects_users", ["project_id"], name: "index_projects_users_on_project_id", using: :btree
  add_index "projects_users", ["user_id"], name: "index_projects_users_on_user_id", using: :btree

  create_table "receipts", force: :cascade do |t|
    t.integer  "refund_claim_id"
    t.date     "expense_date"
    t.string   "description"
    t.decimal  "value"
    t.string   "currency"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.string   "attachment"
  end

  add_index "receipts", ["refund_claim_id"], name: "index_receipts_on_refund_claim_id", using: :btree
  add_index "receipts", ["user_id"], name: "index_receipts_on_user_id", using: :btree

  create_table "refund_claims", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "description"
    t.string   "status",      default: "not submitted"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.datetime "departure"
    t.datetime "return_date"
    t.decimal  "refundable",  default: 0.0
    t.boolean  "posting",     default: false
    t.text     "comment"
  end

  add_index "refund_claims", ["user_id"], name: "index_refund_claims_on_user_id", using: :btree

  create_table "transports", force: :cascade do |t|
    t.string   "transport_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "transports_travel_plans", id: false, force: :cascade do |t|
    t.integer "transport_id"
    t.integer "travel_plan_id"
  end

  add_index "transports_travel_plans", ["transport_id"], name: "index_transports_travel_plans_on_transport_id", using: :btree
  add_index "transports_travel_plans", ["travel_plan_id"], name: "index_transports_travel_plans_on_travel_plan_id", using: :btree

  create_table "travel_plans", force: :cascade do |t|
    t.string   "destination"
    t.date     "departure_date"
    t.date     "return_date"
    t.string   "trip_description"
    t.string   "tickets_description"
    t.decimal  "tickets_cost"
    t.integer  "paid_days",                default: 0
    t.decimal  "daily_allowance",          default: 0.0
    t.decimal  "accommodation_costs",      default: 0.0
    t.string   "accommodation_aalto_paid", default: "nil"
    t.decimal  "events_costs",             default: 0.0
    t.string   "events_aalto_paid",        default: "nil"
    t.string   "other_description"
    t.decimal  "other_costs",              default: 0.0
    t.string   "status",                   default: "not submitted"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "posting",                  default: false
    t.text     "comment"
  end

  create_table "travel_plans_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "travel_plan_id"
  end

  add_index "travel_plans_users", ["travel_plan_id"], name: "index_travel_plans_users_on_travel_plan_id", using: :btree
  add_index "travel_plans_users", ["user_id"], name: "index_travel_plans_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "role",              default: "Student"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count",       default: 0,         null: false
    t.string   "perishable_token"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
