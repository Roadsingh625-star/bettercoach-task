require 'rails_helper'

RSpec.describe CoachesController, type: :controller do
  let(:company) { FactoryBot.create(:company) }
  let(:coach) { FactoryBot.create(:coach) }
  let(:program1) { FactoryBot.create(:program, name: 'Leadership') }
  let(:program2) { FactoryBot.create(:program, name: 'Tech Training') }
  
  let!(:company_program1) { FactoryBot.create(:company_program, program: program1, company: company) }
  let!(:company_program2) { FactoryBot.create(:company_program, program: program2, company: company) }

  before do
    create(:company_program_coach, company_program: company_program1, coach: coach)
    create(:company_program_coach, company_program: company_program2, coach: coach)
    sign_in coach
  end

  describe "GET #dashboard" do
    context "when user is authenticated" do
      it "returns a successful response" do
        get :dashboard
        expect(response).to have_http_status(:success)
      end

      context "with program_name filter" do
        it "filters programs by program name" do
          get :dashboard, params: { filter: { program_name: 'Leadership' } }
          expect(response).to have_http_status(:success)
        end
      end
  
      context "with company_name filter" do
        it "filters programs by company name" do
          get :dashboard, params: { filter: { company_name: company.name } }
          expect(response).to have_http_status(:success)
        end
      end
  
      context "with no assigned programs" do
        before do
          allow(coach).to receive(:company_programs).and_return(CompanyProgram.none)
        end

        it "displays a message when no programs are assigned" do
          get :dashboard
          expect(response).to have_http_status(:success)
        end
      end
    end

    context "when user is not authenticated" do
      before do
        sign_out coach
      end

      it "redirects to the sign-in page" do
        get :dashboard
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
