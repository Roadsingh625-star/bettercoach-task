RailsAdmin.config do |config|
  config.model 'User' do
    list do
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
    end
  end
end
