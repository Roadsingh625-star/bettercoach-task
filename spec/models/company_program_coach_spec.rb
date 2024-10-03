# spec/models/company_program_coach_spec.rb
require 'rails_helper'

RSpec.describe CompanyProgramCoach, type: :model do
  let(:company_program) { FactoryBot.create(:company_program) }
  let(:coach) { FactoryBot.create(:coach) }
  let(:company_program_coach) { FactoryBot.build(:company_program_coach, company_program: company_program, coach: coach) }

  describe 'Associations' do
    it { should belong_to(:company_program) }
    it { should belong_to(:coach) }
  end

  describe 'Validations' do
    it 'validates presence of start_time' do
      company_program_coach.start_time = nil
      expect(company_program_coach).not_to be_valid
      expect(company_program_coach.errors[:start_time]).to include("can't be blank")
    end

    it 'validates presence of end_time' do
      company_program_coach.end_time = nil
      expect(company_program_coach).not_to be_valid
      expect(company_program_coach.errors[:end_time]).to include("can't be blank")
    end
  end
end
