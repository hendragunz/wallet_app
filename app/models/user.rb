class User < ApplicationRecord
  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :email,       presence: true

  has_one :wallet, as: :owner
end
