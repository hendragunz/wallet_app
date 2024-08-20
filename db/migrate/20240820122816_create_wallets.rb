class CreateWallets < ActiveRecord::Migration[7.1]
  def change
    create_table :wallets do |t|
      t.references :owner, polymorphic: true, index: true
      t.decimal :balance, default: 0.0, scale: 2, precision: 10
      t.timestamps
    end
  end
end
