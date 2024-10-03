FactoryBot.define do
  factory :employee, parent: :user, class: 'Employee' do
    sequence(:email) { |n| "employee_#{n}@example.com" }
    type { 'Employee' }
    company
  end
end