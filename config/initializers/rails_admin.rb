Dir[Rails.root.join('app', 'models', 'rails_admin', '*.rb')].each { |file| require file }

require Rails.root.join('app', 'controllers', 'rails_admin', 'actions', 'employees_list_action.rb')

RailsAdmin.config do |config|
  config.asset_source = :sprockets
  config.default_items_per_page = 20

  require 'will_paginate/active_record'

  config.authorize_with do
    authenticate_or_request_with_http_basic do |username, password|
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(ENV['ADMIN_EMAIL'])) &&
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(ENV['ADMIN_PASSWORD']))
    end
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    employees_list_action do
      only ['Company']
    end
  end
end
