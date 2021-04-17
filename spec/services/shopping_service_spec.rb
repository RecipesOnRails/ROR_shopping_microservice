require 'spec_helper'
RSpec.describe ShoppingService do

  it 'can get product upc' do
    VCR.use_cassette('product_search_endpoint') do

      expect(ShoppingService.get_product_upc("chicken", 'eyJhbGciOiJSUzI1NiIsImprdSI6Imh0dHBzOi8vYXBpLmtyb2dlci5jb20vdjEvLndlbGwta25vd24vandrcy5qc29uIiwia2lkIjoiWjRGZDNtc2tJSDg4aXJ0N0xCNWM2Zz09IiwidHlwIjoiSldUIn0.eyJhdWQiOiJyZWNpcGVzb25yYWlscy00ODEwNWU1MmI4ZTNmMzdjMGY1M2I1OWQ4NTQ5YjBmZDQwMDMwNjE0OTg5Njk1OTE3NSIsImV4cCI6MTYxODYyMzE0MywiaWF0IjoxNjE4NjIxMzM4LCJpc3MiOiJhcGkua3JvZ2VyLmNvbSIsInN1YiI6IjVjNWE4NTMxLWM4NTAtNTNhOS04M2M1LThjY2E0NjdiZjhjYSIsInNjb3BlIjoicHJvZHVjdC5jb21wYWN0IiwiYXV0aEF0IjoxNjE4NjIxMzQzOTM4ODA2MzUzLCJwZmN4IjoidXJuOmtyb2dlcmNvOnByb2ZpbGU6c2hvcHBlcjowYTk3YTFjMy0xZjFkLWVkOTItNWY1YS0wMTRmOTk1YTZiN2MiLCJhenAiOiJyZWNpcGVzb25yYWlscy00ODEwNWU1MmI4ZTNmMzdjMGY1M2I1OWQ4NTQ5YjBmZDQwMDMwNjE0OTg5Njk1OTE3NSJ9.CGoeBHqT61Vpw78P7SQl-CSXN-nonPkwmCr8gKHGzPeT-ANhGdtr_VcB70kkQvfG-DLR5iVPl7ECfY_sFl9VeJKZ5rtfMxz8PUzTq0aVaTQ9-ICG0B-D0Tr19znx2ECr5pZRmuPcvRoLnGHOcQJ5bKcLpkeSTwyi6tKOn6gG2RCBMarBJrg3Ty7UPtkGfqGrAals0JFh6cCRU91XKvspMlTJcRk4zuoR6u9QdbqUesCD60pTdYUb0GfUlyV-mM_0is5GaTH4T-mSi6IKCm1EV6bFXZ97Omy_BlbhWPBNDyPYCxAcyL5DqK2qIPl-W2t8fYdtVKdecqnAgX9hT6tkFA')).to eq("0021065600000")
    end
  end

  it 'adds product to shopping cart' do
    VCR.use_cassette('add_to_cart_endpoint') do
      ShoppingService.add_to_cart(1, "0021065600000", 'eyJhbGciOiJSUzI1NiIsImprdSI6Imh0dHBzOi8vYXBpLmtyb2dlci5jb20vdjEvLndlbGwta25vd24vandrcy5qc29uIiwia2lkIjoiWjRGZDNtc2tJSDg4aXJ0N0xCNWM2Zz09IiwidHlwIjoiSldUIn0.eyJhdWQiOiJyZWNpcGVzb25yYWlscy00ODEwNWU1MmI4ZTNmMzdjMGY1M2I1OWQ4NTQ5YjBmZDQwMDMwNjE0OTg5Njk1OTE3NSIsImV4cCI6MTYxODY5ODg5NCwiaWF0IjoxNjE4Njk3MDg5LCJpc3MiOiJhcGkua3JvZ2VyLmNvbSIsInN1YiI6IjdlOWY4ZmVjLTMwMWUtNWEzMy1hMWYxLTFiMWVjM2NmZmI1ZCIsInNjb3BlIjoiY2FydC5iYXNpYzp3cml0ZSIsImF1dGhBdCI6MTYxODY5NzA5NDUzODYxMjM2OCwicGZjeCI6InVybjprcm9nZXJjbzpwcm9maWxlOnNob3BwZXI6YzRiN2U2YmQtOTEzMi00MTYxLTg4ZGEtMjk4MDY2MmJmZWEwIiwiYXpwIjoicmVjaXBlc29ucmFpbHMtNDgxMDVlNTJiOGUzZjM3YzBmNTNiNTlkODU0OWIwZmQ0MDAzMDYxNDk4OTY5NTkxNzUifQ.fWWBd0VwdNvndOmkgsP8WSXFL_4aa9gvB2AIuTj4aGZuriitB81Kf27w_F0fm2lb8HjYehT_YZR6VWWXq6cRQJnD15pdebB-wh02K3e-t8GqkIFrEeetmwJUMwLJD_N6hJCdQsYRxfaP5ljadwQh7TDSQ3_DvgwXG4K-b4da3tD8U8-pBMAElG_rsws9gR2uwxcOHYC2WH34qjN2hUHPozz9d87QlD9GKeHVQuK9sCY5YFF6-ihia1fvryBuQ_q7riSrMMooanoq5xa21jDNKJ4RF-e7Of2nd3psF-ilBftX2Eier-oAnZ5M_vJ7ExBojtFjw0v3hCzlo7e37gqKkA')

      expect(response.status).to eq(200)
    end
  end
end
