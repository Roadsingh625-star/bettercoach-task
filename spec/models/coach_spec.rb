require 'rails_helper'

RSpec.describe Coach, type: :model do
  let(:coach) { FactoryBot.create(:coach, first_name: 'John', last_name: 'Doe') }

  describe 'Associations' do
    it { should have_many(:company_program_coaches).dependent(:destroy) }
    it { should have_many(:company_programs).through(:company_program_coaches) }
  end

  describe '#full_name' do
    it 'returns the full name of the coach' do
      expect(coach.full_name).to eq('John Doe')
    end
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(coach).to be_valid
    end
  end
end
