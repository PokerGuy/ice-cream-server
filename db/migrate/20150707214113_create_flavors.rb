class CreateFlavors < ActiveRecord::Migration
  def change
    create_table :flavors do |t|
      t.string :name
      t.integer :stock_quantity
      t.integer :price_id

      t.timestamps null: false
    end
  end
end
