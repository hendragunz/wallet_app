# == Schema Information
#
# Table name: wallets
#
#  id         :integer          not null, primary key
#  owner_type :string
#  owner_id   :integer
#  balance    :decimal(10, 2)   default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Wallet < ApplicationRecord
  has_many :inbound_transactions,   class_name: 'Transaction', foreign_key: :to_wallet_id
  has_many :outbound_transactions,  class_name: 'Transaction', foreign_key: :from_wallet_id
  belongs_to :owner, polymorphic: true

  validates :balance, numericality: { greater_than_or_equal_to: 0.0 }
end
