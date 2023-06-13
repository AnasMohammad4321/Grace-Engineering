class CreateWarehouses < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouses do |t|
      t.references :inventory, null: false, foreign_key: true
      t.float :quantity_in_stock

      t.timestamps
    end
  end
end
