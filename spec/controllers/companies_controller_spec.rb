require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:company) { FactoryBot.create(:company) }
  let!(:company_program) { FactoryBot.create(:company_program, company: company) }

  before do
    sign_in user
  end

  describe "GET #show" do
    context "when the company exists" do
      it "returns a successful response" do
        get :show, params: { id: company.id }
        expect(response).to have_http_status(:success)
      end
    end
  end
end
