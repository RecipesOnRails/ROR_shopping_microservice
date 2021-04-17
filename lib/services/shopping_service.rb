require 'sinatra'
require 'json'
class ShoppingService

  def self.connection(token)
    Faraday.new("https://api.kroger.com") do |conn|
      conn.headers['Authorization'] = "Bearer #{token}"
      conn.headers['Cache-Control'] = 'no-cache'
    end
  end

  def self.get_product_upc(product, token)
    response = connection(token).get('/v1/products') do |conn|
      conn.params['filter.term'] = product
    end
    data = response.body
    JSON.parse(data, symbolize_names: true).first[1][0][:upc]
  end

  def self.add_to_cart(quantity, upc, token)
    response = connection(token).put('/v1/cart/add') do |conn|
      conn.params['quantity'] = quantity
      conn.params['upc'] = upc
    end
    require "pry";binding.pry
    data = response.body

  end
end
