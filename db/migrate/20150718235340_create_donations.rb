class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :name
      t.decimal :amount
      t.boolean :allow_display, :default => true

      t.timestamps null: false
    end
  end
end
