class Coach < User
  has_many :company_program_coaches, dependent: :destroy
  has_many :company_programs, through: :company_program_coaches

  def full_name
    "#{first_name} #{last_name}"
  end
end
