class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  scope :coaches, -> { where(type: 'Coach') }
  scope :employees, -> { where(type: 'Employee') }
end
