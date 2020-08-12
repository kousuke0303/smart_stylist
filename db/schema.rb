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

ActiveRecord::Schema.define(version: 2019_12_31_025942) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "kana"
    t.string "tel_1"
    t.string "tel_2"
    t.string "fax"
    t.string "email"
    t.string "address"
    t.string "note"
    t.string "work"
    t.date "birth_year"
    t.integer "birth_month"
    t.integer "birth_day"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "kind"
    t.date "ordered_on"
    t.date "sold_on"
    t.date "delivered_on"
    t.string "retail"
    t.integer "deposit"
    t.boolean "traded"
    t.integer "wage"
    t.integer "cloth"
    t.integer "lining"
    t.integer "button"
    t.integer "postage"
    t.integer "other"
    t.boolean "wage_pay", default: false
    t.boolean "cloth_pay", default: false
    t.boolean "lining_pay", default: false
    t.boolean "button_pay", default: false
    t.boolean "postage_pay", default: false
    t.boolean "other_pay", default: false
    t.boolean "unpaid", default: false
    t.string "note"
    t.integer "plant_id"
    t.string "img_1"
    t.string "img_2"
    t.string "img_3"
    t.string "img_4"
    t.string "img_5"
    t.string "img_6"
    t.string "img_7"
    t.string "img_8"
    t.string "img_1_note"
    t.string "img_2_note"
    t.string "img_3_note"
    t.string "img_4_note"
    t.string "img_5_note"
    t.string "img_6_note"
    t.string "img_7_note"
    t.string "img_8_note"
    t.bigint "user_id"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "plants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "tel_1"
    t.string "tel_2"
    t.string "fax"
    t.string "email"
    t.string "staff_1"
    t.string "staff_2"
    t.string "note"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plants_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "question"
    t.string "answer"
    t.string "customer_id"
    t.string "card_id"
    t.string "subscription_id"
    t.boolean "pay_status", default: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "clients", "users"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "users"
  add_foreign_key "plants", "users"
end
