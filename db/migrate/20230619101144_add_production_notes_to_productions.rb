class AddProductionNotesToProductions < ActiveRecord::Migration[7.0]
  def change
    add_column :productions, :production_notes, :string
  end
end
