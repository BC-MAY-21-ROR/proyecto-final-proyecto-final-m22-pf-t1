# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_16_224103) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "nit"
    t.string "country", default: "Colombia"
    t.string "city"
    t.string "telephone"
    t.string "email"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "dni"
    t.string "full_name", null: false
    t.string "telephone"
    t.string "birthday"
    t.string "email"
    t.bigint "business_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_customers_on_business_id"
  end

  create_table "deductions", force: :cascade do |t|
    t.datetime "date", null: false
    t.integer "amount", null: false
    t.bigint "stylist_id", null: false
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stylist_id"], name: "index_deductions_on_stylist_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "date", null: false
    t.bigint "customer_id", null: false
    t.integer "amount", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", default: 1
    t.integer "adjustment", default: 0
    t.bigint "stylist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_order_items_on_invoice_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
    t.index ["stylist_id"], name: "index_order_items_on_stylist_id"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "date", null: false
    t.bigint "invoice_id", null: false
    t.integer "value", null: false
    t.string "kind"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_payments_on_invoice_id"
  end

  create_table "payrolls", force: :cascade do |t|
    t.integer "dni"
    t.string "name"
    t.date "initial_date"
    t.date "final_date"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "reference"
    t.string "name"
    t.text "description"
    t.integer "price", null: false
    t.boolean "actived", default: true
    t.decimal "cannon", default: "0.0"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["reference"], name: "index_products_on_reference", unique: true
  end

  create_table "stylists", force: :cascade do |t|
    t.string "dni", null: false
    t.string "name"
    t.string "telephone"
    t.string "role"
    t.boolean "actived", default: true
    t.bigint "business_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_stylists_on_business_id"
    t.index ["dni"], name: "index_stylists_on_dni", unique: true
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "manager"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "businesses", "users"
  add_foreign_key "customers", "businesses"
  add_foreign_key "deductions", "stylists"
  add_foreign_key "invoices", "customers"
  add_foreign_key "order_items", "invoices"
  add_foreign_key "order_items", "products"
  add_foreign_key "order_items", "stylists"
  add_foreign_key "payments", "invoices"
  add_foreign_key "products", "categories"
  add_foreign_key "stylists", "businesses"
  add_foreign_key "subcategories", "categories"
end
