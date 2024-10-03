class CompanyProgramsController < ApplicationController

  def show
    @company = Company.find_by_id(params[:id])  
  
    if @company
      @company_programs = CompanyProgram.includes(:program, :employees, :coaches)
                                        .where(company: @company)
                                        .paginate(page: params[:page], per_page: 10)
  
      respond_to do |format|
        format.html { render 'show' }
        format.json {
          render json: @company_programs.map { |company_program|
            {
              id: company_program.id,
              name: company_program.program.name
            }
          }
        }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: "Company not found." }
        format.json { render json: { error: "Company not found." }, status: :not_found }
      end
    end
  end

  def join_program
    company_program = CompanyProgram.find_by_id(params[:id])
    if company_program.nil?
      flash[:alert] = "company_program not found."
      redirect_to company_path(current_user.company) and return
    end
    current_user.join_program(company_program)
    redirect_to company_path(current_user.company), notice: 'You have successfully joined the program.' 
  end

end
  
  