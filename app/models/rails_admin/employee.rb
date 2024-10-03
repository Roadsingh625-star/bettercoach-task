RailsAdmin.config do |config|
  config.model 'Employee' do
    list do
      scopes [:employees]
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
      field :type
    end
  end
end
  