class CreateOrderLineItems < ActiveRecord::Migration
  def change
    create_table :order_line_items do |t|
      t.integer :order_id
      t.integer :flavor_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
