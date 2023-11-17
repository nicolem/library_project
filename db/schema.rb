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

ActiveRecord::Schema.define(version: 2023_11_17_212809) do

  create_table "borrowers", force: :cascade do |t|
    t.string "name", null: false
    t.string "credit_card", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "credit_card"], name: "index_borrowers_on_name_and_credit_card", unique: true
  end

  create_table "borrowers_libraries", id: false, force: :cascade do |t|
    t.integer "borrower_id", null: false
    t.integer "library_id", null: false
    t.index ["borrower_id", "library_id"], name: "index_borrowers_libraries_on_borrower_id_and_library_id", unique: true
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_libraries_on_name", unique: true
  end

end
