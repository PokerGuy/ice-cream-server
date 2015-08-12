class RemovePriceIdFromFlavor < ActiveRecord::Migration
  def change
    remove_column :flavors, :price_id
  end
end
