class RemoveCoachIdFromCompanyPrograms < ActiveRecord::Migration[7.1]
  def change
    remove_column :company_programs, :coach_id, :integer
  end
end
