class Rest::Base < Grape::API
  format :json
  prefix :api

  mount Rest::V1::API => '/'

end
