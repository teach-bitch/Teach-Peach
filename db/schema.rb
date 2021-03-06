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

ActiveRecord::Schema.define(version: 2019_03_21_124841) do

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

  create_table "article_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_categories_on_article_id"
    t.index ["category_id"], name: "index_article_categories_on_category_id"
  end

  create_table "articles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.boolean "for_adult", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_baskets_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facturations", force: :cascade do |t|
    t.bigint "basket_id"
    t.bigint "user_id"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["basket_id"], name: "index_facturations_on_basket_id"
    t.index ["user_id"], name: "index_facturations_on_user_id"
  end

  create_table "join_product_categories", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "product_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_join_product_categories_on_product_category_id"
    t.index ["product_id"], name: "index_join_product_categories_on_product_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "basket_id"
    t.bigint "product_id"
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["basket_id"], name: "index_line_items_on_basket_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "brand"
    t.decimal "price"
    t.integer "quantity"
    t.string "reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typeforms", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.string "id_typeform"
    t.string "id_results"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "for_adult", default: false
    t.index ["user_id"], name: "index_typeforms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.datetime "birthdate"
    t.integer "role"
    t.string "customer_id"
    t.string "subscription_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "article_categories", "articles"
  add_foreign_key "article_categories", "categories"
  add_foreign_key "line_items", "baskets"
  add_foreign_key "line_items", "products"
  add_foreign_key "typeforms", "users"
end
