class WithdrawTransaction < Transaction

  belongs_to :from_wallet,  class_name: 'Wallet'

end
