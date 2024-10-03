require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let!(:employee) { FactoryBot.create(:employee) }
  let!(:coach) { FactoryBot.create(:coach) }

  describe "#after_sign_in_path_for" do
    context "when the resource is a Coach" do
      it "redirects to the coach dashboard" do
        expect(controller.after_sign_in_path_for(coach)).to eq(coach_dashboard_path)
      end
    end

    context "when the resource is an Employee" do
      it "redirects to the company path" do
        expect(controller.after_sign_in_path_for(employee)).to eq(company_path(employee.company))
      end
    end
  end
end
