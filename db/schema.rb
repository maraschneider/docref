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

ActiveRecord::Schema.define(version: 2019_11_26_135355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "approval_fields", force: :cascade do |t|
    t.bigint "approval_id"
    t.bigint "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approval_id"], name: "index_approval_fields_on_approval_id"
    t.index ["field_id"], name: "index_approval_fields_on_field_id"
  end

  create_table "approvals", force: :cascade do |t|
    t.string "headline"
    t.text "content"
    t.bigint "specialty_id"
    t.bigint "giver_id"
    t.bigint "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["giver_id"], name: "index_approvals_on_giver_id"
    t.index ["receiver_id"], name: "index_approvals_on_receiver_id"
    t.index ["specialty_id"], name: "index_approvals_on_specialty_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "consultation_times"
    t.string "website"
    t.string "phone_number"
    t.string "email"
    t.string "clinic_picture"
    t.text "description"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
    t.bigint "specialty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specialty_id"], name: "index_fields_on_specialty_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_fields", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_user_fields_on_field_id"
    t.index ["user_id"], name: "index_user_fields_on_user_id"
  end

  create_table "user_specialties", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "specialty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specialty_id"], name: "index_user_specialties_on_specialty_id"
    t.index ["user_id"], name: "index_user_specialties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "clinic_id"
    t.string "first_name"
    t.string "last_name"
    t.string "profile_picture"
    t.string "title"
    t.string "position"
    t.text "bio"
    t.boolean "only_private_insurance"
    t.index ["clinic_id"], name: "index_users_on_clinic_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "approval_fields", "approvals"
  add_foreign_key "approval_fields", "fields"
  add_foreign_key "approvals", "specialties"
  add_foreign_key "approvals", "users", column: "giver_id"
  add_foreign_key "approvals", "users", column: "receiver_id"
  add_foreign_key "fields", "specialties"
  add_foreign_key "user_fields", "fields"
  add_foreign_key "user_fields", "users"
  add_foreign_key "user_specialties", "specialties"
  add_foreign_key "user_specialties", "users"
  add_foreign_key "users", "clinics"
end
