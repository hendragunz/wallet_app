# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  hashed_password :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  include Walletable

  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :email,       presence: true

  has_one :wallet, as: :owner
end
