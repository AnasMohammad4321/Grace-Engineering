class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.string :customer_name
      t.float :order_total

      t.timestamps
    end
  end
end
