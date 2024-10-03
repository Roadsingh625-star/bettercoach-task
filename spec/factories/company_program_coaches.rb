FactoryBot.define do
  factory :company_program_coach do
    association :company_program
    association :coach
    start_time { Time.now }
    end_time { Time.now + 1.hour }
  end
end
