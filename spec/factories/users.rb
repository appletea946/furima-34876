FactoryBot.define do
  factory :user do
    nickname              { "furima太朗" }
    email                 { Faker::Internet.email }
    password              { "123abc" }
    password_confirmation { password }
    last_name_kanji       { "山田" }
    first_name_kanji      { "太朗" }
    last_name_katakana    { "ヤマダ" }
    first_name_katakana   { "タロウ" }
    birthday              {"2020-01-01" }
  end
end
