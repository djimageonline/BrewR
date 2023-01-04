Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Breweries
  get "/breweries" => "breweries#index"
  get "/breweries/:id" => "breweries#show"

  # USERS SIGN UP
  post "/users" => "users#create"

  # USERS LOGIN
  post "/sessions" => "sessions#create"


  # TOUR
  get "/tours" => "tours#index"
  post "/tours" => "tours#create"
  get "/tours/:id" => "tours#show"
  delete "/tours/:id" => "tours#destroy"
  get "/tours" => "tours#index"
  
  
  # BREWERY TOUR
  get "/breweries_tours" => "breweries_tours#index"
  post "/breweries_tours" => "breweries_tours#create"
  get "/breweries_tours/:id" => "breweries_tours#show"


end
