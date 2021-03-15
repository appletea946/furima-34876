FactoryBot.define do
  factory :order_address do
    token             { 'tok_abcdefghijk00000000000000' }
    postal_code       { '000-1111' }
    prefecture_id     { 48 }
    municipality      { '市区町村' }
    address           { '番地1-2-3' }
    building_name     { '建物building' }
    phone_number      { '09012345678' }
  end
end
