class Company < ApplicationRecord
  has_many :company_programs, dependent: :destroy
  has_many :programs, through: :company_programs
  has_many :employees

  validates :name, :email, :address, :city, :state, :country, :phone_number, presence: true
  validates :name, uniqueness: true
end
