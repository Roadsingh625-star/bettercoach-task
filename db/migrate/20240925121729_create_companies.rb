class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :phone_number
      t.timestamps
    end
  end
end
