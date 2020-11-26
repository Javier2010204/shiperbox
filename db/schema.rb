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

ActiveRecord::Schema.define(version: 2020_11_25_154717) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.decimal "dai"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "code"
    t.decimal "product_price", precision: 8, scale: 2, default: "0.0"
    t.decimal "shipping_us", precision: 8, scale: 2, default: "0.0"
    t.integer "product_weight", default: 1
    t.boolean "shiperrbox_buy", default: true
    t.decimal "home_service", precision: 8, scale: 2, default: "0.0"
    t.string "link"
    t.decimal "total", precision: 8, scale: 2, default: "0.0"
    t.string "status"
    t.integer "category_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_orders_on_category_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "price_cents"
    t.decimal "price", precision: 8, scale: 2
    t.integer "cost_cents"
    t.decimal "cost", precision: 8, scale: 2
    t.integer "total_cents"
    t.decimal "total", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name", default: "Mi usuario ShiperBox"
    t.integer "phone"
    t.date "birthday"
    t.string "nit"
    t.string "tax_residence"
    t.string "business_name"
    t.string "address"
    t.text "delivery_instructions"
    t.string "contact_name1"
    t.integer "contact_phone1"
    t.string "contact_name2"
    t.integer "contact_phone2"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.integer "code"
    t.decimal "product_price", precision: 12, scale: 8
    t.decimal "shipping_us", precision: 12, scale: 8
    t.integer "product_weight", default: 1
    t.string "category"
    t.boolean "shiperbox_buy", default: false
    t.boolean "home_service", default: true
    t.decimal "home_service_option", precision: 12, scale: 8
    t.string "link"
    t.decimal "total", precision: 12, scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id"
    t.index ["category_id"], name: "index_quotes_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "categories"
  add_foreign_key "orders", "users"
  add_foreign_key "profiles", "users"
end
