require 'rails_helper'

RSpec.describe CompanyProgram, type: :model do
  let(:company) { FactoryBot.create(:company) }
  let(:program) { FactoryBot.create(:program) }
  let(:coach) { FactoryBot.create(:coach) }
  let(:company_program) { FactoryBot.create(:company_program, company: company, program: program) }

  describe 'Associations' do
    it { should belong_to(:company) }
    it { should belong_to(:program) }
    
    it { should have_many(:employee_company_programs).dependent(:destroy) }
    it { should have_many(:employees).through(:employee_company_programs) }
    it { should have_many(:company_program_coaches).dependent(:destroy) }
    it { should have_many(:coaches).through(:company_program_coaches) }
  end

  describe 'Validations' do
    it 'validates uniqueness of coach scoped to company and program' do
      company_program_coach = FactoryBot.create(:company_program_coach, company_program: company_program, coach: coach)
      expect(company_program).to be_valid
      duplicate_company_program = FactoryBot.create(:company_program, company: company, program: program)
      duplicate_company_program_coach = FactoryBot.build(:company_program_coach, company_program: duplicate_company_program, coach: coach)
    end
  end

  describe 'Dependent destruction' do
    let!(:employee_company_program) { FactoryBot.create(:employee_company_program, company_program: company_program) }

    it 'destroys associated employee_company_programs when company_program is destroyed' do
      expect {
        company_program.destroy
      }.to change(EmployeeCompanyProgram, :count).by(-1)
    end
  end
end
