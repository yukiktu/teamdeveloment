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

ActiveRecord::Schema.define(version: 2019_09_16_182018) do

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "yuuki0421ktu@gmail.com", null: false
    t.string "encrypted_password", default: "kattakatao", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "arrivals", force: :cascade do |t|
    t.integer "item_id"
    t.integer "artist_id"
    t.integer "arrival_count"
    t.date "purchase_order_date"
    t.date "arrival_expected_date"
    t.string "arrival_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "supplier"
  end

  create_table "artists", force: :cascade do |t|
    t.string "artist_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.integer "item_count", default: 1
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_adresses", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.string "addressee", null: false
    t.text "postal_code", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "address", null: false
    t.index ["address"], name: "index_delivery_adresses_on_address"
    t.index ["addressee"], name: "index_delivery_adresses_on_addressee"
    t.index ["phone_number"], name: "index_delivery_adresses_on_phone_number"
  end

  create_table "discs", force: :cascade do |t|
    t.integer "item_id"
    t.string "disc_name"
    t.integer "disc_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "end_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "kana_last_name", null: false
    t.string "kana_first_name", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.integer "enrollment_status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_end_users_on_address"
    t.index ["email"], name: "index_end_users_on_email", unique: true
    t.index ["first_name"], name: "index_end_users_on_first_name"
    t.index ["kana_first_name"], name: "index_end_users_on_kana_first_name"
    t.index ["kana_last_name"], name: "index_end_users_on_kana_last_name"
    t.index ["last_name"], name: "index_end_users_on_last_name"
    t.index ["phone_number"], name: "index_end_users_on_phone_number"
    t.index ["reset_password_token"], name: "index_end_users_on_reset_password_token", unique: true
  end

  create_table "gacket_images", force: :cascade do |t|
    t.integer "item_id"
    t.integer "jacket_number"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "label_id"
    t.string "item_name"
    t.decimal "list_price"
    t.decimal "cost_price"
    t.string "sales_status"
    t.date "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "genre_id"
    t.integer "artist_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "label_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "item_name", null: false
    t.integer "item_count", null: false
    t.decimal "list_price", null: false
    t.decimal "tax_rate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "artist_name", null: false
    t.integer "item_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.string "addressee", null: false
    t.string "postal_code", null: false
    t.text "address", null: false
    t.string "phone_number"
    t.string "payment_methods", null: false
    t.decimal "subtotal", null: false
    t.decimal "shipping_fee", null: false
    t.decimal "grand_total", null: false
    t.integer "delivery_status", default: 0
    t.string "artist_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_orders_on_address"
    t.index ["addressee"], name: "index_orders_on_addressee"
    t.index ["end_user_id"], name: "index_orders_on_end_user_id"
    t.index ["phone_number"], name: "index_orders_on_phone_number"
  end

  create_table "shipping_fees", force: :cascade do |t|
    t.integer "shipping_fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.integer "disc_id"
    t.integer "recording_number"
    t.string "song_title"
    t.time "play_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tax_rates", force: :cascade do |t|
    t.decimal "tax_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
