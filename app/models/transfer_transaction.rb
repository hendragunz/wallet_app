class TransferTransaction < Transaction

  belongs_to :from_wallet,  class_name: 'Wallet'
  belongs_to :to_wallet,    class_name: 'Wallet'

end
