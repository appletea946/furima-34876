FactoryBot.define do
  factory :order_address do
    token             {"tok_abcdefghijk00000000000000"}
    postal_code       {"000-1111"}
    prefecture_id     {40}
    municipality      {"市区町村"}
    address           {"番地"}
    phone_number      {00011112222}
    user_id           {1}
    item_id           {1}
  end
end
