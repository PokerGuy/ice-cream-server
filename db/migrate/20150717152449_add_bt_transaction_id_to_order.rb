class AddBtTransactionIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :bt_transaction_id, :string
  end
end
