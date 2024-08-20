class Team < ApplicationRecord
  validates :name, presence: true
  has_one :wallet, as: :owner
end
