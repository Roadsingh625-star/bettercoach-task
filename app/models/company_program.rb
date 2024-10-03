class CompanyProgram < ApplicationRecord
  belongs_to :company
  belongs_to :program

  has_many :employee_company_programs, dependent: :destroy
  has_many :employees, through: :employee_company_programs

  has_many :company_program_coaches, dependent: :destroy
  has_many :coaches, through: :company_program_coaches
  
end
