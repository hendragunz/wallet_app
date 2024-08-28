module Rest::V1
  class API < Grape::API
    version 'v1'

    get 'ping' do
      "Hello from me!"
    end

    mount Rest::V1::Users::Transactions
    # mount Rest::V1::Teams::Transactions # todo
  end
end
