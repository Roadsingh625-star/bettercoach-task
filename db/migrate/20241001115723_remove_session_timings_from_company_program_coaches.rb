class RemoveSessionTimingsFromCompanyProgramCoaches < ActiveRecord::Migration[7.1]
  def change
    remove_column :company_program_coaches, :session_timings, :string
  end
end
