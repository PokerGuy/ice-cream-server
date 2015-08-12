class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :flavor_id
      t.date :start_date
      t.date :end_date
      t.decimal :price

      t.timestamps null: false
    end
  end
end
