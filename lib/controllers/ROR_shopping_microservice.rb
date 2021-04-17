
require 'sinatra'
require 'json'

class ShoppingMicroserviceController < Sinatra::Base
  get '/' do
    content_type :json

    data = {message: 'Hello World!'}
    data.to_json
  end

  get '/products' do

    response = Faraday.get('https://api.kroger.com/v1/products') do |req|
      req.params['filter.term'] = ''
      req.headers['Authorization'] = 'Bearer eyJhbGciOiJSUzI1NiIsImprdSI6Imh0dHBzOi8vYXBpLmtyb2dlci5jb20vdjEvLndlbGwta25vd24vandrcy5qc29uIiwia2lkIjoiWjRGZDNtc2tJSDg4aXJ0N0xCNWM2Zz09IiwidHlwIjoiSldUIn0.eyJhdWQiOiJyZWNpcGVzb25yYWlscy00ODEwNWU1MmI4ZTNmMzdjMGY1M2I1OWQ4NTQ5YjBmZDQwMDMwNjE0OTg5Njk1OTE3NSIsImV4cCI6MTYxODUzOTAyNiwiaWF0IjoxNjE4NTM3MjIxLCJpc3MiOiJhcGkua3JvZ2VyLmNvbSIsInN1YiI6IjVjNWE4NTMxLWM4NTAtNTNhOS04M2M1LThjY2E0NjdiZjhjYSIsInNjb3BlIjoicHJvZHVjdC5jb21wYWN0IiwiYXV0aEF0IjoxNjE4NTM3MjI2OTcyNDczNTAyLCJwZmN4IjoidXJuOmtyb2dlcmNvOnByb2ZpbGU6c2hvcHBlcjowYTk3YTFjMy0xZjFkLWVkOTItNWY1YS0wMTRmOTk1YTZiN2MiLCJhenAiOiJyZWNpcGVzb25yYWlscy00ODEwNWU1MmI4ZTNmMzdjMGY1M2I1OWQ4NTQ5YjBmZDQwMDMwNjE0OTg5Njk1OTE3NSJ9.oOrH6NuGh9PSpApkMp5n0x1pTjoeuUZ8msCp6uTf1RWb8xylLTq7dAwztbZLGA0F3aXbv2nEmgsv62C8QGcJmeXeuXxnzn99qqTAE6hJIEcU00rkpk_e7vPGXqpGOcx45HeP-VGEDegMH10pMtVMsMXxrNI2h_-MEF66Jzecc2yE9DLTYh_ivkIbm2-JJu9rEaT7KhyAX3-zKR00rjlu_dfPscOkyzgnlqdLVlwBXkRddtV2BOw4zIGeS8fLE72Q4C_NeJEfNDNGSsnLx5fuWDVM4fJ4hgjxn4E6nuo_xgP-jiKHnnLWMyRR-r6t_HA0K43WyjaExr08uAsbSxHkNA'
      req.headers['Cache-Control'] = 'no-cache'
    end
    binding.pry
  end
end
require_relative "services/shopping_service"
