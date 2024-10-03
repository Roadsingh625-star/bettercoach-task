# programs_controller.rb
class ProgramsController < ApplicationController
  def show
    @program = Program.find(params[:id])
    @company_program = @program.company_programs.find_by(company: current_user.company)
    if @company_program.nil?
      flash[:alert] = "You are not enrolled in this program."
      redirect_to programs_path and return
    end
  end
end
  