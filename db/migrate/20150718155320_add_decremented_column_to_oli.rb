class AddDecrementedColumnToOli < ActiveRecord::Migration
  def change
    add_column :order_line_items, :decremented, :boolean
  end
end
