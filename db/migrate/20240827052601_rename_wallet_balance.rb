class RenameWalletBalance < ActiveRecord::Migration[7.1]
  def change
    rename_column :wallets, :balance, :initial_balance
  end
end
