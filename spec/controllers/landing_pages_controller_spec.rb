require 'rails_helper'

RSpec.describe LandingPagesController, type: :controller do
  let!(:companies) { create_list(:company, 15) }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @companies" do
      get :index
      expect(assigns(:companies)).to match_array(companies[0..8])
    end
  end
end
