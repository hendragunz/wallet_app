# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  name       :string
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Stock < ApplicationRecord
  include Walletable

  validates :name, presence: true
  validates :number, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  has_one :wallet, as: :owner
end
