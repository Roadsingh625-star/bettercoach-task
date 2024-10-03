class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(Coach)
        coach_dashboard_path
    elsif resource.is_a?(Employee)
      company_path(resource.company)
    else
      super
    end
  end
end
