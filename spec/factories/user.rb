FactoryBot.define do
  factory :user do
    first_name { 'Jane' }
    last_name { 'Doe' }
    email { 'jane.doe@example.com' }
    phone_number { '1234567890' }
    password { 'password' }
  end
end
