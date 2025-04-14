Rails.application.routes.draw do
  post "/zipcode" => "zipcode#search", as: "zipcode"

  get "home/zipcode"
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end
