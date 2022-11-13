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

ActiveRecord::Schema[7.0].define(version: 2022_11_10_134043) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_classifications", force: :cascade do |t|
    t.string "user_classification_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "password"
    t.string "last_name"
    t.string "first_name"
    t.string "zipcode"
    t.string "prefecture"
    t.string "municipality"
    t.string "address"
    t.string "apartments"
    t.string "email"
    t.string "phone_number"
    t.bigint "user_classification_id", null: false
    t.string "company_name"
    t.boolean "delete_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_classification_id"], name: "index_users_on_user_classification_id"
  end

  add_foreign_key "users", "user_classifications"
end
