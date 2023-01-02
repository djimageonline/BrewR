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

  # CREATE TOUR
  get "/tours" => "breweries_tours#index"
  post "/tours" => "tours#create"
  # SHOW TOUR
  get "/tours/:id" => "tours#show"
  delete "/tours/:id" => "tours#destroy"
  
  
  # CREATE/ADD A BREWERY TOUR
  get "/breweries_tours" => "breweries_tours#index"
  post "/breweries_tours" => "breweries_tours#create"
  # SHOW BRWERY/TOUR
  get "/breweries_tours/:id" => "breweries_tours#show"


end
