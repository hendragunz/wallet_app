class Stock < ApplicationRecord
  validates :name, presence: true
  validates :number, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  has_one :wallet, as: :owner
end
