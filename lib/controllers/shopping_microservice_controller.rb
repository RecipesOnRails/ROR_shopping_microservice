require 'sinatra'
require 'json'

class ShoppingMicroserviceController < Sinatra::Base
  get '/' do
    content_type :json

    data = {message: 'Hello World!'}
    data.to_json
  end

  get '/products' do
    product = params['product']
    token = params['token']
    ShoppingService.get_product_upc(product, token)
  end

  put '/cart/add' do
    quantity = params['quantity']
    upc = params['upc']
    token = params['token']
    ShoppingService.add_to_cart(quantity, upc, token)
  end
end
