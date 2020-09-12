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

ActiveRecord::Schema.define(version: 20171119130156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "check_in", null: false
    t.date "check_out", null: false
    t.bigint "guest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "companions", default: 0
    t.index ["guest_id"], name: "index_bookings_on_guest_id"
  end

  create_table "bookings_rooms", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_bookings_rooms_on_booking_id"
    t.index ["room_id"], name: "index_bookings_rooms_on_room_id"
  end

  create_table "cleaning_environments", force: :cascade do |t|
    t.date "cleaning_date"
    t.bigint "environment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["environment_id"], name: "index_cleaning_environments_on_environment_id"
  end

  create_table "cleaning_rooms", force: :cascade do |t|
    t.date "cleaning_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
    t.index ["room_id"], name: "index_cleaning_rooms_on_room_id"
  end

  create_table "courtesies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courtesies_services", force: :cascade do |t|
    t.bigint "courtesy_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["courtesy_id"], name: "index_courtesies_services_on_courtesy_id"
    t.index ["service_id"], name: "index_courtesies_services_on_service_id"
  end

  create_table "courtesies_uses", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "courtesy_id"
    t.date "used_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_courtesies_uses_on_booking_id"
    t.index ["courtesy_id"], name: "index_courtesies_uses_on_courtesy_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "office"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "environments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "environments_uses", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "environment_id"
    t.date "used_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_environments_uses_on_booking_id"
    t.index ["environment_id"], name: "index_environments_uses_on_environment_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.float "total_value"
    t.string "payment_type"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id"
    t.index ["booking_id"], name: "index_invoices_on_booking_id"
    t.index ["employee_id"], name: "index_invoices_on_employee_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals_uses", force: :cascade do |t|
    t.date "used_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "booking_id"
    t.bigint "meal_id"
    t.index ["booking_id"], name: "index_meals_uses_on_booking_id"
    t.index ["meal_id"], name: "index_meals_uses_on_meal_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "number", null: false
    t.integer "guest_limit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_rooms_on_number", unique: true
  end

  create_table "rooms_services", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_rooms_services_on_room_id"
    t.index ["service_id"], name: "index_rooms_services_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services_uses", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "service_id"
    t.date "used_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_services_uses_on_booking_id"
    t.index ["service_id"], name: "index_services_uses_on_service_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "guests"
  add_foreign_key "bookings_rooms", "bookings"
  add_foreign_key "bookings_rooms", "rooms"
  add_foreign_key "cleaning_environments", "environments"
  add_foreign_key "cleaning_rooms", "rooms"
  add_foreign_key "courtesies_services", "courtesies"
  add_foreign_key "courtesies_services", "services"
  add_foreign_key "courtesies_uses", "bookings"
  add_foreign_key "courtesies_uses", "courtesies"
  add_foreign_key "environments_uses", "bookings"
  add_foreign_key "environments_uses", "environments"
  add_foreign_key "invoices", "bookings"
  add_foreign_key "invoices", "employees"
  add_foreign_key "meals_uses", "bookings"
  add_foreign_key "meals_uses", "meals"
  add_foreign_key "rooms_services", "rooms"
  add_foreign_key "rooms_services", "services"
  add_foreign_key "services_uses", "bookings"
  add_foreign_key "services_uses", "services"
end
