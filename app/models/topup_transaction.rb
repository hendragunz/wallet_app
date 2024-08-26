class TopupTransaction < Transaction

  belongs_to :to_wallet,    class_name: 'Wallet'

end
