module Rest::V1
  class API < Grape::API
    version 'v1'

    get 'ping' do
      "Hello from me!"
    end
  end
end
