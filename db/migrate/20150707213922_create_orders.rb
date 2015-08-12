class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
