class AddNonceToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :nonce, :string
  end
end
