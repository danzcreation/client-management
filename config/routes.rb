Rails.application.routes.draw do
  get 'home/index'
  resources :organizations do
    resources :people
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
