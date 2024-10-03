require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Scopes' do
    let!(:coach) { FactoryBot.create(:coach) }
    let!(:employee) { FactoryBot.create(:employee, company: FactoryBot.create(:company)) }

    it 'returns only coaches when using the coaches scope' do
      expect(User.coaches).to include(coach)
      expect(User.coaches).not_to include(employee)
    end

    it 'returns only employees when using the employees scope' do
      expect(User.employees).to include(employee)
      expect(User.employees).not_to include(coach)
    end
  end
end
