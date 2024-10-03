class CreateCompanyProgramCoaches < ActiveRecord::Migration[7.1]
  def change
    create_table :company_program_coaches do |t|
      t.references :company_program, null: false, foreign_key: true
      t.references :coach, null: false, foreign_key: { to_table: :users }
      t.string :session_timings

      t.timestamps
    end
  end
end
