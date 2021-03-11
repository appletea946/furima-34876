FactoryBot.define do
  factory :item do
    name                { Faker::Lorem.characters(number: 40) }
    description         { Faker::Lorem.characters(number: 1000) }
    category_id         { Faker::Number.between(from: 2, to: 11) }
    status_id           { Faker::Number.between(from: 2, to: 7) }
    shipping_charges_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id       { Faker::Number.between(from: 2, to: 48) }
    days_to_ship_id     { Faker::Number.between(from: 2, to: 4) }
    price               { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
