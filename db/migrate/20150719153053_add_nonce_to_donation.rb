class AddNonceToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :nonce, :string
  end
end
