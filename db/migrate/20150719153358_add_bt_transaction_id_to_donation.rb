class AddBtTransactionIdToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :bt_transaction_id, :string
  end
end
