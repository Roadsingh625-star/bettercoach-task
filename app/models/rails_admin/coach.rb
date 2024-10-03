RailsAdmin.config do |config|
  config.model 'Coach' do
    list do
      scopes [:coaches]
      field :email
      field :first_name
      field :last_name
      field :phone_number
      field :password
      field :type
    end

    edit do
      field :email
      field :first_name
      field :last_name
      field :phone_number
      field :password
      field :type 

      field :company_programs do
        hide
      end
    end
  end
end
