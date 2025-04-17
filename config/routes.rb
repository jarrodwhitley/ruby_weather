Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "users/new"
  get "users/create"
  get "/register" => "users#new", as: "register"
  post "/users" => "users#create", as: "users"
  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: "logout"

  get "/twitter" => "twitter#index", as: "twitter"
  post "/twitter/create" => "twitter#create", as: "twitter_create"
  post "/aqi/results" => "aqi#search", as: "aqi_results"
  get "/aqi" => "aqi#show", as: "aqi_search"
  root "home#index"
end
