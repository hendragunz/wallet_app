# == Schema Information
#
# Table name: transactions
#
#  id             :integer          not null, primary key
#  type           :string
#  from_wallet_id :integer
#  to_wallet_id   :integer
#  amount         :decimal(10, 2)   default(0.0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class TransferTransaction < Transaction

  belongs_to :from_wallet,  class_name: 'Wallet'
  belongs_to :to_wallet,    class_name: 'Wallet'

  validates_with BalanceValidator, on: :create
end
