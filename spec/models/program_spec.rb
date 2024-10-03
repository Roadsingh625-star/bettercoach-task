require 'rails_helper'

RSpec.describe Program, type: :model do
  let(:program) { FactoryBot.create(:program) }

  describe 'Associations' do
    it { should have_many(:company_programs).dependent(:destroy) }
    it { should have_many(:companies).through(:company_programs) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }

    it 'is valid with valid attributes' do
      expect(program).to be_valid
    end

    it 'is invalid without a name' do
      program.name = nil
      expect(program).not_to be_valid
      expect(program.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a description' do
      program.description = nil
      expect(program).not_to be_valid
      expect(program.errors[:description]).to include("can't be blank")
    end

    it 'is invalid with a duplicate name' do
      FactoryBot.create(:program, name: 'Unique Name')
      duplicate_program = FactoryBot.build(:program, name: 'Unique Name')

      expect(duplicate_program).not_to be_valid
      expect(duplicate_program.errors[:name]).to include('has already been taken')
    end
  end
end
