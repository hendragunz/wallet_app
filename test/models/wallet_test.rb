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
require "test_helper"

class WalletTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
