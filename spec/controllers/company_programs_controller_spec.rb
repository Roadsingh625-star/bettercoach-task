require 'rails_helper'

RSpec.describe CompanyProgramsController, type: :controller do
  let(:employee) { FactoryBot.create(:employee) }
  let(:company) { FactoryBot.create(:company) }
  let(:program) { FactoryBot.create(:program) }
  let!(:company_program) { FactoryBot.create(:company_program, company: company, program: program) }

  before do
    sign_in employee
  end

  describe "GET #show" do
    context "when the company exists" do
      it "returns a successful response" do
        get :show, params: { id: company.id }
        expect(response).to have_http_status(:success)
      end

      it "assigns the requested company to @company" do
        get :show, params: { id: company.id }
        expect(assigns(:company)).to eq(company)
      end

      it "loads the company programs" do
        get :show, params: { id: company.id }
        expect(assigns(:company_programs)).to include(company_program)
      end

      it "responds with JSON when requested" do
        request.accept = "application/json"
        get :show, params: { id: company.id }
        json_response = JSON.parse(response.body)
        expect(json_response).to be_an(Array)
        expect(json_response.first['name']).to eq(program.name)
      end
    end

    context "when the company does not exist" do
      it "redirects to the root path" do
        get :show, params: { id: 99999 }
        expect(response).to redirect_to(root_path)
      end

      it "sets a flash alert message" do
        get :show, params: { id: 99999 }
        expect(flash[:alert]).to eq("Company not found.")
      end

      it "responds with a 404 JSON error when requested" do
        request.accept = "application/json"
        get :show, params: { id: 99999 }
        expect(response).to have_http_status(:not_found)
        json_response = JSON.parse(response.body)
        expect(json_response['error']).to eq("Company not found.")
      end
    end
  end

  describe "POST #join_program" do
    context "when the company_program exists" do
      it "successfully joins the program" do
        expect {
          post :join_program, params: { id: company_program.id }
        }.to change { employee.company_programs.count }.by(1)
        expect(response).to redirect_to(company_path(employee.company))
        expect(flash[:notice]).to eq('You have successfully joined the program.')
    end
  end

    context "when the company_program does not exist" do
      it "redirects to company path with an alert" do
        post :join_program, params: { id: 99999 }
        expect(response).to redirect_to(company_path(employee.company))
        expect(flash[:alert]).to eq("company_program not found.")
      end
    end
  end
end
