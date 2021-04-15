ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'pry'
require_relative 'ROR_shopping_microservice'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'ROR_shopping_microservice' do
  it 'should return "Hello World"' do
    get '/'

    assert_equal(last_response.headers['Content-Type'], "application/json")

    payload = JSON.parse(last_response.body, symbolize_names: true)

    assert_equal(payload[:message], "Hello World!")
  end
end
