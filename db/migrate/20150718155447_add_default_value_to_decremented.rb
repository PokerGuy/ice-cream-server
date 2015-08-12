class AddDefaultValueToDecremented < ActiveRecord::Migration
  def change
    change_column :order_line_items, :decremented, :boolean, :default => false
  end
end
