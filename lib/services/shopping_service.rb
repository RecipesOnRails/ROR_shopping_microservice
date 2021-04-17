require 'sinatra'
require 'json'
class ShoppingService

  def connection(token)
    binding.pry
    Faraday.new("https://api.kroger.com") do |conn|
      conn.headers['Authorization'] = "Bearer #{token}"
      conn.headers['Cache-Control'] = 'no-cache'
  end

  def get_data(uri, product, token)
    binding.pry
    response = connection(token).get(uri) do |conn|
      conn.params['filter.term'] = product
    end
    data = response.body
    JSON.parse(data, symbolize_names: true)
    binding.pry
  end
end
