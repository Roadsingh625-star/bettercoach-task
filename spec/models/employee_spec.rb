require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:company) { FactoryBot.create(:company) }
  let(:program) { FactoryBot.create(:program) }
  let(:company_program) { FactoryBot.create(:company_program, company: company, program: program) }
  let(:employee) { FactoryBot.create(:employee, company: company) }

  describe 'Associations' do
    it { should belong_to(:company) }
    it { should have_many(:employee_company_programs).dependent(:destroy) }
    it { should have_many(:company_programs).through(:employee_company_programs) }
  end

  describe '#join_program' do
    context 'when employee joins a program' do
      it 'creates an EmployeeCompanyProgram record' do
        expect {
          employee.join_program(company_program)
        }.to change(EmployeeCompanyProgram, :count).by(1)
      end

      it 'associates the employee with the correct program' do
        employee.join_program(company_program)
        expect(employee.company_programs).to include(company_program)
      end
    end

    context 'when employee is already in the program' do
      it 'does not create a duplicate EmployeeCompanyProgram record' do
        employee.join_program(company_program)
        
        expect {
          employee.join_program(company_program)
        }.not_to change(EmployeeCompanyProgram, :count)
      end
    end
  end
end
