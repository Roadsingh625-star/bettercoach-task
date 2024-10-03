class EmployeeCompanyProgram < ApplicationRecord
  belongs_to :employee
  belongs_to :company_program

  validates :employee, uniqueness: {
    scope: [:company_program]
  }
end
