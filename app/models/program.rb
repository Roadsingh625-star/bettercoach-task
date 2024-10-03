class Program < ApplicationRecord
  has_many :company_programs, dependent: :destroy
  has_many :companies, through: :company_programs

  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
