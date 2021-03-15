FactoryBot.define do
  factory :order_address do
    token             { 'tok_abcdefghijk00000000000000' }
    postal_code       { '000-1111' }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    municipality      { Gimei.city.kanji }
    address           { '番地1-2-3' }
    phone_number      { Faker::Number.number(digits: 11) }
    user_id           { 1 }
    item_id           { 1 }
  end
end
