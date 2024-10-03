RailsAdmin.config do |config|
  config.model 'Company' do
	list do
		field :name
		field :description
		field :email
		field :address
		field :city
		field :state
		field :country
		field :phone_number
		items_per_page 10 
	end

	edit do
		field :name
		field :description
		field :email
		field :address
		field :city
		field :state
		field :country
		field :phone_number

		field :company_programs do
			hide
		end

		field :programs do
			hide
		end

		field :employees do
			hide
		end
	end

    show do
      field :name
      field :description
      field :email
	  field :address
	  field :city
	  field :state
	  field :country
	  field :phone_number
    end
  end
end
  