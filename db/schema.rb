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

ActiveRecord::Schema[7.0].define(version: 2022_11_13_141629) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "category_name", limit: 32
    t.string "string_limit", limit: 32
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_statuses", force: :cascade do |t|
    t.string "product_status_name", limit: 32
    t.string "string_limit", limit: 32
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name", limit: 64
    t.string "string_limit", limit: 64
    t.bigint "category_id", null: false
    t.integer "price"
    t.string "description"
    t.bigint "sale_status_id", null: false
    t.bigint "product_status_id", null: false
    t.datetime "resist_date"
    t.boolean "delete_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["product_status_id"], name: "index_products_on_product_status_id"
    t.index ["sale_status_id"], name: "index_products_on_sale_status_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "purchase_price"
    t.integer "product_quantity"
    t.string "purchase_company", limit: 128
    t.string "string_limit", limit: 128
    t.datetime "order_date"
    t.datetime "purchase_date"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_purchases_on_product_id"
  end

  create_table "sale_statuses", force: :cascade do |t|
    t.string "sale_status", limit: 32
    t.string "string_limit", limit: 32
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "products", "categories"
  add_foreign_key "products", "product_statuses"
  add_foreign_key "products", "sale_statuses"
  add_foreign_key "purchases", "products"
end
