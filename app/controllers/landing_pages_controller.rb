class LandingPagesController < ApplicationController
  def index 
    @companies = Company.paginate(page: params[:page], per_page: 9)
  end
end