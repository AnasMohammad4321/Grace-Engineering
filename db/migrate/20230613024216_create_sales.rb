class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :inventory, null: false, foreign_key: true
      t.float :quantity_sold
      t.date :sale_date
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
