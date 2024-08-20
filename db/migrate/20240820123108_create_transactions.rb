class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :type
      t.references :from_wallet, index: true
      t.references :to_wallet, index: true
      t.decimal :amount, default: 0.0, scale: 2, precision: 10
      t.timestamps
    end
  end
end
