class CompanyProgramCoach < ApplicationRecord
  belongs_to :company_program
  belongs_to :coach
  validates :start_time, presence: true
  validates :end_time, presence: true
end
  