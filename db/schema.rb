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

ActiveRecord::Schema[7.0].define(version: 2022_07_04_110149) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "circuits", force: :cascade do |t|
    t.string "nom"
    t.string "pays"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classecuries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "divisions", force: :cascade do |t|
    t.string "nom"
    t.integer "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipes", force: :cascade do |t|
    t.string "nom"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.string "circuit"
    t.string "division"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "saison_id"
    t.bigint "division_id"
    t.integer "numero"
    t.index ["division_id"], name: "index_events_on_division_id"
    t.index ["saison_id"], name: "index_events_on_saison_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "licences", force: :cascade do |t|
    t.integer "penalite"
    t.integer "recupere"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id"
    t.bigint "pilote_id"
    t.index ["event_id"], name: "index_licences_on_event_id"
    t.index ["pilote_id"], name: "index_licences_on_pilote_id"
  end

  create_table "pilotes", force: :cascade do |t|
    t.string "nom"
    t.string "statut"
    t.integer "ecurie"
    t.string "division"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "division_id"
    t.index ["division_id"], name: "index_pilotes_on_division_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "body"
    t.string "access"
    t.string "passcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resultats", force: :cascade do |t|
    t.integer "qualification"
    t.integer "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pilote_id"
    t.bigint "event_id"
    t.boolean "dotd"
    t.boolean "mt"
    t.decimal "score"
    t.integer "ecurie"
    t.index ["event_id"], name: "index_resultats_on_event_id"
    t.index ["pilote_id"], name: "index_resultats_on_pilote_id"
  end

  create_table "saisons", force: :cascade do |t|
    t.string "nom"
    t.integer "numeroSaison"
    t.date "periode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "events", "divisions"
  add_foreign_key "events", "saisons"
  add_foreign_key "licences", "events"
  add_foreign_key "licences", "pilotes"
  add_foreign_key "pilotes", "divisions"
  add_foreign_key "resultats", "events"
  add_foreign_key "resultats", "pilotes"
end
