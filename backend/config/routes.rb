Rails.application.routes.draw do
  resources :indicators_lists
  resources :indicators
  resources :actions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  post 'add-action', to: 'actions#create'
  match 'add-action', to: 'actions#create', via: [:options, :post]
  get 'get-actions', to: 'actions#index'
  post 'add-indicator', to: 'indicators#create'
  get 'get-indicators', to: 'indicators_lists#index'
  post 'new-indicator', to: 'indicators_lists#create'
end
