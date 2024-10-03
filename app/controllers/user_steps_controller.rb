class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :step2

  before_action :set_user, only: [:show, :update]

  def show
    if @user.nil?
      flash[:alert] = "User not found."
      redirect_to root_path and return
    end

    if params[:step] == 'step2'
      @company_program = CompanyProgram.find(@user.company_program_id)
      @coaches = @company_program.coaches.select(:id, :first_name).order(:first_name)
      render 'users/registrations/step2'
    end
  end

  def update
    if @user.nil?
      flash[:alert] = "User not found."
      redirect_to root_path and return
    end

    case params[:step]
    when "step2"
      @user.assign_attributes(user_params)

      if @user.valid?
        @user.save
        company_program = CompanyProgram.find_by_id(@user.company_program_id)
        if company_program
          @user.join_program(company_program)
        end
        sign_in(@user)
        redirect_to company_path(@user.company)
      else
        flash.now[:error] = "There was an issue with your submission."
        @coaches = Coach.all
        render "users/registrations/step2"
      end
    end
  end

  private

  def set_user
    @user = User.find_by_id(params[:user_id])
  end

  def user_params
    params.require(:employee).permit(:first_name, :last_name, :phone_number, :email, :password, :password_confirmation, :company_id,
                                 :company_program_id, :coach_id)
  end
end
