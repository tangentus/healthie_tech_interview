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

ActiveRecord::Schema[8.1].define(version: 2026_08_04_171000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "clients", force: :cascade do |t|
    t.text "address", null: false
    t.datetime "created_at", null: false
    t.text "name", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_clients_on_address", unique: true
    t.index ["name"], name: "index_clients_on_name", unique: true
  end

  create_table "provider_client_joins", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.text "plan", null: false
    t.bigint "provider_id", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_provider_client_joins_on_client_id"
    t.index ["provider_id", "client_id"], name: "index_provider_client_joins_on_provider_id_and_client_id", unique: true
    t.index ["provider_id"], name: "index_provider_client_joins_on_provider_id"
  end

  create_table "providers", force: :cascade do |t|
    t.text "address", null: false
    t.datetime "created_at", null: false
    t.text "name", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_providers_on_address", unique: true
    t.index ["name"], name: "index_providers_on_name", unique: true
  end

  add_foreign_key "provider_client_joins", "clients"
  add_foreign_key "provider_client_joins", "providers"
end
