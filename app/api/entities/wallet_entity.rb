module Entities
  class WalletEntity < Grape::Entity
    root 'wallets', 'accwalletount'

    expose :id, documentation: {
      type: "Integer",
      desc: "The account's unique identifier",
      example: 42
    }

    expose :available_balance, documentation: {
      type: "Float",
      desc: "The total realtime available balance for this wallet",
      example: 409.4
    }

    expose :created_at, documentation: {
      type: "String",
      format: "date-time",
      desc: "When the wallet record was created",
      example: Time.now.utc.iso8601(3)
    }

  end
end
