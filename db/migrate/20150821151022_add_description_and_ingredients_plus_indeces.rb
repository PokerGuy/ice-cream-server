class AddDescriptionAndIngredientsPlusIndeces < ActiveRecord::Migration
  def change
    add_column :flavors, :description, :text
    add_column :flavors, :ingredients, :text

    add_index :blogs, [:created_at]
    add_index :donations, [:created_at]
    add_index :flavors, [:name]
    add_index :order_line_items, [:flavor_id, :order_id]
    add_index :orders, [:created_at]
    add_index :prices, [:flavor_id]

  end
end
