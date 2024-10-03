class CoachesController < ApplicationController
  before_action :authenticate_user!

  # ^GET - /dashboard
  def dashboard
    @assigned_programs = current_user.company_programs.includes(:program, :company).paginate(page: params[:page], per_page: 3)
    if params[:filter].present?
      if params[:filter][:program_name].present?
        @assigned_programs = @assigned_programs.joins(:program).where("programs.name ILIKE ?", "%#{params[:filter][:program_name]}%")
      end

      if params[:filter][:company_name].present?
        @assigned_programs = @assigned_programs.joins(:company).where("companies.name ILIKE ?", "%#{params[:filter][:company_name]}%")
      end
    end

    @no_assigned_programs = @assigned_programs.blank?
  end
end
  