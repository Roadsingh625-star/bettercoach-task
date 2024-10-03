class AddTimingsToCompanyProgramCoaches < ActiveRecord::Migration[7.1]
  def change
    add_column :company_program_coaches, :start_time, :datetime
    add_column :company_program_coaches, :end_time, :datetime
  end
end
