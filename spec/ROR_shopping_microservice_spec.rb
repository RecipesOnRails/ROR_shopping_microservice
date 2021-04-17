
require 'spec_helper'
RSpec.describe ShoppingMicroserviceController, type: :request do

   it 'returns hello world' do

    get '/'
    body = JSON.parse(last_response.body, symbolize_names: true)
    expect(body[:message]).to eq("Hello World!")
  end

  it 'returns product upc' do
    VCR.use_cassette('product_search_endpoint') do
      params={:product => 'chicken',
    :token => 'eyJhbGciOiJSUzI1NiIsImprdSI6Imh0dHBzOi8vYXBpLmtyb2dlci5jb20vdjEvLndlbGwta25vd24vandrcy5qc29uIiwia2lkIjoiWjRGZDNtc2tJSDg4aXJ0N0xCNWM2Zz09IiwidHlwIjoiSldUIn0.eyJhdWQiOiJyZWNpcGVzb25yYWlscy00ODEwNWU1MmI4ZTNmMzdjMGY1M2I1OWQ4NTQ5YjBmZDQwMDMwNjE0OTg5Njk1OTE3NSIsImV4cCI6MTYxODYyMzE0MywiaWF0IjoxNjE4NjIxMzM4LCJpc3MiOiJhcGkua3JvZ2VyLmNvbSIsInN1YiI6IjVjNWE4NTMxLWM4NTAtNTNhOS04M2M1LThjY2E0NjdiZjhjYSIsInNjb3BlIjoicHJvZHVjdC5jb21wYWN0IiwiYXV0aEF0IjoxNjE4NjIxMzQzOTM4ODA2MzUzLCJwZmN4IjoidXJuOmtyb2dlcmNvOnByb2ZpbGU6c2hvcHBlcjowYTk3YTFjMy0xZjFkLWVkOTItNWY1YS0wMTRmOTk1YTZiN2MiLCJhenAiOiJyZWNpcGVzb25yYWlscy00ODEwNWU1MmI4ZTNmMzdjMGY1M2I1OWQ4NTQ5YjBmZDQwMDMwNjE0OTg5Njk1OTE3NSJ9.CGoeBHqT61Vpw78P7SQl-CSXN-nonPkwmCr8gKHGzPeT-ANhGdtr_VcB70kkQvfG-DLR5iVPl7ECfY_sFl9VeJKZ5rtfMxz8PUzTq0aVaTQ9-ICG0B-D0Tr19znx2ECr5pZRmuPcvRoLnGHOcQJ5bKcLpkeSTwyi6tKOn6gG2RCBMarBJrg3Ty7UPtkGfqGrAals0JFh6cCRU91XKvspMlTJcRk4zuoR6u9QdbqUesCD60pTdYUb0GfUlyV-mM_0is5GaTH4T-mSi6IKCm1EV6bFXZ97Omy_BlbhWPBNDyPYCxAcyL5DqK2qIPl-W2t8fYdtVKdecqnAgX9hT6tkFA'}
    get '/products', params
    expect(last_response.body).to eq("0021065600000")
    end
  end
end
