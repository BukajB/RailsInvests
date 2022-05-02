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

ActiveRecord::Schema[7.0].define(version: 2022_05_01_192539) do
  create_table "assets", force: :cascade do |t|
    t.string "asset_name"
    t.string "bought_amount"
    t.string "buy_price"
    t.string "buy_fees"
    t.string "total_input"
    t.string "sold_amount"
    t.string "sell_price"
    t.string "sell_fees"
    t.string "total_output"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  

  create_table "invests", force: :cascade do |t|
    t.string "asset_name"
    t.decimal "bought_amount"
    t.decimal "buy_price"
    t.decimal "buy_fees"
    t.decimal "total_input"
    t.decimal "sold_amount"
    t.decimal "sell_price"
    t.decimal "sell_fees"
    t.decimal "total_output"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_invests_on_user_id"
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

  

end
