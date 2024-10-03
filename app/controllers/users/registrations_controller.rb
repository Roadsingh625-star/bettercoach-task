class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :set_companies, only: [:new, :create]

  def after_sign_up_path_for(resource)
    user_wizard_path(resource.id, :step2)
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_id, :company_program_id, :first_name, :last_name, :phone_number, :email, :password, :password_confirmation, :type])
  end

  private

  def set_companies
    @companies = Company.all 
  end
end
