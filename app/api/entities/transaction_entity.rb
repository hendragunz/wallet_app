module Entities
  class TransactionEntity < Grape::Entity
    root 'transactions', 'transaction'

    expose :id, documentation: {
      type: "Integer",
      desc: "The transaction's unique identifier",
      example: 424542
    }

    expose :type, documentation: {
      type: "String",
      desc: "The transaction's type",
      example: "TransferTransaction"
    }

    expose :amount, documentation: {
      type: "Float",
      desc: "The total transaction amount",
      example: 409.4
    }

    expose :from_wallet_id, documentation: {
      type: "Integer",
      example: 21488
    }

    expose :to_wallet_id, documentation: {
      type: "Integer",
      example: 21488
    }

    expose :created_at, documentation: {
      type: "String",
      format: "date-time",
      desc: "When the transaction was created",
      example: 1.month.ago.utc.iso8601(3)
    }

  end
end
