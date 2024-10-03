FactoryBot.define do
  factory :company_program do
    association :company
    association :program
    after(:create) do |company_program|
      create(:company_program_coach, company_program: company_program)
    end
  end
end