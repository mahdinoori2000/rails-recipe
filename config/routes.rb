Rails.application.routes.draw do
  # Food Routes
  get 'recipe_foods/index'
  get 'foods/' => 'foods#index', as: 'foods'
  get 'foods/new' => 'foods#new', as: 'add_food'
  get 'foods/delete/:id' => 'foods#destroy', as: 'delete_food'

  post 'foods/create' => 'foods#create', as: 'create_food'
  resources :recipes
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  root "foods#index"
end
