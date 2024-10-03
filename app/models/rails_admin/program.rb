RailsAdmin.config do |config|
  config.model 'Program' do
    list do
	  field :name
	  field :description
	  field :key_points
		end

	edit do
	  field :name
	  field :description
	  field :key_points
	end
  end
end
	