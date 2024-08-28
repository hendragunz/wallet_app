class BalanceValidator < ActiveModel::Validator
  def validate(record)
    return true if record.is_a?(TopupTransaction) # no need to check balance for this kind of transaction

    source_wallet   = case record
                        when TransferTransaction then record.from_wallet
                        when WithdrawTransaction then record.from_wallet
                      end

    if record.amount > source_wallet.available_balance
      record.errors.add(:base, "Insufficient funds")
    end
  end
end
