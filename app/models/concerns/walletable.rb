module Walletable
  extend ActiveSupport::Concern

  included do
    before_create :setup_wallet
  end

  private

  def setup_wallet
    self.build_wallet
  end
end
