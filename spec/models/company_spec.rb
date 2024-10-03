require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { FactoryBot.create(:company) }

  describe 'Associations' do
    it { should have_many(:company_programs).dependent(:destroy) }
    it { should have_many(:programs).through(:company_programs) }
    it { should have_many(:employees) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:phone_number) }

    it 'is valid with valid attributes' do
      expect(company).to be_valid
    end

    it 'is invalid without a name' do
      company.name = nil
      expect(company).not_to be_valid
      expect(company.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without an email' do
      company.email = nil
      expect(company).not_to be_valid
      expect(company.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without an address' do
      company.address = nil
      expect(company).not_to be_valid
      expect(company.errors[:address]).to include("can't be blank")
    end

    it 'is invalid without a city' do
      company.city = nil
      expect(company).not_to be_valid
      expect(company.errors[:city]).to include("can't be blank")
    end

    it 'is invalid without a state' do
      company.state = nil
      expect(company).not_to be_valid
      expect(company.errors[:state]).to include("can't be blank")
    end

    it 'is invalid without a country' do
      company.country = nil
      expect(company).not_to be_valid
      expect(company.errors[:country]).to include("can't be blank")
    end

    it 'is invalid without a phone number' do
      company.phone_number = nil
      expect(company).not_to be_valid
      expect(company.errors[:phone_number]).to include("can't be blank")
    end

    it 'is invalid with a duplicate name' do
      FactoryBot.create(:company, name: 'Unique Name')
      duplicate_company = FactoryBot.build(:company, name: 'Unique Name')

      expect(duplicate_company).not_to be_valid
      expect(duplicate_company.errors[:name]).to include('has already been taken')
    end
  end
end
