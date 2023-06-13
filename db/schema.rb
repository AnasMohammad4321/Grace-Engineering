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

ActiveRecord::Schema[7.0].define(version: 2023_06_13_024216) do
  create_table "inventories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date "order_date"
    t.string "customer_name"
    t.float "order_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productions", force: :cascade do |t|
    t.integer "inventory_id", null: false
    t.float "quantity_used"
    t.date "production_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_productions_on_inventory_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "inventory_id", null: false
    t.float "quantity_sold"
    t.date "sale_date"
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_sales_on_inventory_id"
    t.index ["order_id"], name: "index_sales_on_order_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.integer "inventory_id", null: false
    t.float "quantity_in_stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_warehouses_on_inventory_id"
  end

  add_foreign_key "productions", "inventories"
  add_foreign_key "sales", "inventories"
  add_foreign_key "sales", "orders"
  add_foreign_key "warehouses", "inventories"
end
