Rails.application.routes.draw do
  # Food Routes
  get 'foods/' => 'foods#index', as: 'foods'
  get 'foods/new' => 'foods#new', as: 'add_food'
  get 'foods/delete/:id' => 'foods#destroy', as: 'delete_food'
   get 'general_shopping_list' => 'foods#shopping_list'

  post 'foods/create' => 'foods#create', as: 'create_food'
  resources :recipes
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Recipe routes
  get 'recipe_foods' => 'recipe_foods#index', as:'recipe_foods'
  get 'recipe_foods/new' => 'recipe_foods#new', as:'add_recipe_food'
  post 'recipe_foods/create' => 'recipe_foods#create', as:'create_recipe_food'
  get 'recipe_foods/delete/:id' => 'recipe_foods#destroy', as: 'delete_recipe_food'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  root "foods#index"
end
