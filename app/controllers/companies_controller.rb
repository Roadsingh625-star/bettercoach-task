class CompaniesController < ApplicationController
  before_action :authenticate_user!

  # ^GET - /companies/id
  def show
    @company = Company.find_by_id(params[:id])
    @company_programs = CompanyProgram.includes(:employees)
    .where(company: @company)
    .paginate(page: params[:page], per_page: 2)
  end
end
  