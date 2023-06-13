class CreateProductions < ActiveRecord::Migration[7.0]
  def change
    create_table :productions do |t|
      t.references :inventory, null: false, foreign_key: true
      t.float :quantity_used
      t.date :production_date

      t.timestamps
    end
  end
end
