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

ActiveRecord::Schema.define(version: 2018_12_13_091819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "establishments", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "siret"
    t.text "description"
    t.string "phone"
    t.text "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_establishments_on_email", unique: true
    t.index ["reset_password_token"], name: "index_establishments_on_reset_password_token", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_id"
    t.index ["service_id"], name: "index_events_on_service_id"
    t.index ["student_id"], name: "index_events_on_student_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "resource_type"
    t.string "name"
    t.text "description"
    t.boolean "is_active"
    t.bigint "establishment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_resources_on_establishment_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "duration"
    t.bigint "establishment_id"
    t.bigint "teacher_id"
    t.bigint "resource_id"
    t.bigint "sub_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_services_on_establishment_id"
    t.index ["resource_id"], name: "index_services_on_resource_id"
    t.index ["sub_category_id"], name: "index_services_on_sub_category_id"
    t.index ["teacher_id"], name: "index_services_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.text "address"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "title"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "sub_categories_teachers", id: false, force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "sub_category_id", null: false
    t.index ["sub_category_id", "teacher_id"], name: "index_sub_categories_teachers_on_sub_category_id_and_teacher_id"
    t.index ["teacher_id", "sub_category_id"], name: "index_sub_categories_teachers_on_teacher_id_and_sub_category_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "siret"
    t.text "description"
    t.string "phone"
    t.text "address"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

end
