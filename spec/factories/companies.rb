FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "Company #{n}" }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end