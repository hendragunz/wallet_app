class Transaction < ApplicationRecord
  validates :from_wallet
  validates :to_wallet

  validates :amount, numericality: { greater_than: 0.0 }
end
