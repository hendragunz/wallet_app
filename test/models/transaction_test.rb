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
require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
