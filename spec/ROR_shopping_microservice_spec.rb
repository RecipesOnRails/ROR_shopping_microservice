
require 'spec_helper'
RSpec.describe ShoppingMicroserviceController, type: :request do

   it 'returns hello world' do

    get '/'
    body = JSON.parse(last_response.body, symbolize_names: true)
    expect(body[:message]).to eq("Hello World!")
  end

  it 'returns product search' do
    get '/products'
  end
end
