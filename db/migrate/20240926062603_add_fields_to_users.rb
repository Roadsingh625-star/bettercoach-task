class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :company_program_id, :integer
    add_column :users, :coach_id, :integer
  end
end
