FactoryBot.define do
  factory :coach, parent: :user, class: 'Coach' do
    sequence(:email) { |n| "coach_#{n}@example.com" }
    first_name { "John" }
    last_name { "Doe" }
    type { 'Coach' }
  end
end