class Wallet < ApplicationRecord
  has_many :inbound_transactions,   class_name: 'TransferTransaction', foreign_key: :to_wallet_id
  has_many :outbound_transactions,  class_name: 'TransferTransaction', foreign_key: :from_wallet_id

  validates :number, numericality: { greater_than_or_equal_to: 0.0 }
end
