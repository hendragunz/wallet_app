module Rest::V1
  class Transactions < Grape::API

    # POST - /transfer
    # POST - /topup
    # POST - /withdraw
    #
    resources :transactions do
      params do
        requires :from_wallet_id, allow_blank: false, type: Integer
        requires :to_wallet_id,   allow_blank: false, type: Integer
        requires :amount,         allow_blank: false, type: Float
      end
      post 'transfer' do

      end

      params do
        requires :to_wallet_id,   allow_blank: false, type: Integer
        requires :amount,         allow_blank: false, type: Float
      end
      post 'topup' do
      end

      params do
        requires :from_wallet_id, allow_blank: false, type: Integer
        requires :amount,         allow_blank: false, type: Float
      end
      post 'withdraw' do
      end
    end
  end
end
