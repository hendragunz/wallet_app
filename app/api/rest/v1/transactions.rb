module Rest::V1
  class API < Grape::API

    # POST - /transfer
    # POST - /topup
    # POST - /withdraw
    #
    resources :transactions do
      params do

      end
      post 'transfer' do
      end

      post 'topup' do
      end

      post 'withdraw' do
      end
    end
  end
end
