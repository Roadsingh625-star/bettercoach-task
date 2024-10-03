Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get "up" => "rails/health#show", as: :rails_health_check
  root 'landing_pages#index'

  resources :companies 

  resources :users do
    get 'wizard/:step', to: 'user_steps#show', as: 'wizard'
    patch 'wizard/:step', to: 'user_steps#update'
  end
  resources :company_programs, only: [:show]
  resources :programs do
    member do
      post 'join', to: 'programs#join' # Adjust the action as needed
    end 
  end

  namespace :rails_admin do
    resources :companies do
      member do
        get 'employees_list'
      end
    end
  end
  
# resources :programs, only: [:show]
# resources :company_programs, only: [:show] do
#   member do
#     get 'coaches'
#   end
# end
  # resources :companies, only: [:show]

  resources :company_programs, only: [:show] do
    member do
      post 'join_program'
    end
  end

  get 'coach_dashboard', to: 'coaches#dashboard', as: 'coach_dashboard'
end
