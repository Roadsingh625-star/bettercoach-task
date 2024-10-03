RSpec.describe UserStepsController, type: :controller do
  let!(:company_program) { FactoryBot.create(:company_program) }
  let!(:employee) { FactoryBot.create(:employee, company_program_id: company_program.id) }
  let!(:coaches) { FactoryBot.create_list(:coach, 5, company_program_id: company_program.id) }

  before do
    sign_in employee
  end

  describe "GET #show" do
    context "when the employee exists" do
      it "returns a successful response" do
        get :show, params: { user_id: employee.id, step: 'step2' }
        expect(response).to have_http_status(:success)
      end
    end

    context "when the user does not exist" do
      it "redirects to the root path" do
        get :show, params: { user_id: 99999, step: 'step2' }
        expect(response).to redirect_to(root_path)
      end

      it "sets a flash alert message" do
        get :show, params: { user_id: 99999, step: 'step2' }
        expect(flash[:alert]).to eq("User not found.")
      end
    end
  end

  describe "PATCH #update" do
    context "when the employee exists" do
      context "when user attributes are valid" do
        it "updates the user and redirects to company path" do
          patch :update, params: { user_id: employee.id, step: 'step2', employee: { first_name: "NewFirstName", last_name: "NewLastName" } }
          employee.reload
          expect(employee.first_name).to eq("NewFirstName")
          expect(response).to redirect_to(company_path(employee.company))
        end

        it "signs in the user after updating" do
          patch :update, params: { user_id: employee.id, step: 'step2', employee: { first_name: "NewFirstName", last_name: "NewLastName" } }
          expect(controller.current_user).to eq(employee)
        end
      end

      context "when user attributes are invalid" do
        it "renders the step2 template with an error message" do
          patch :update, params: { user_id: employee.id, step: 'step2', employee: { email: nil } }
          expect(flash.now[:error]).to eq("There was an issue with your submission.")
          expect(response).to render_template("users/registrations/step2")
        end
      end
    end

    context "when the employee does not exist" do
      it "redirects to the root path" do
        patch :update, params: { user_id: 99999, step: 'step2' }
        expect(response).to redirect_to(root_path)
      end

      it "sets a flash alert message" do
        patch :update, params: { user_id: 99999, step: 'step2' }
        expect(flash[:alert]).to eq("User not found.")
      end
    end
  end
end
