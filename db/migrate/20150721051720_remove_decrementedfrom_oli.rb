class RemoveDecrementedfromOli < ActiveRecord::Migration
  def change
    remove_column :order_line_items, :decremented
  end
end
