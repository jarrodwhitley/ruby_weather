Rails.application.routes.draw do
  post "/zipcode" => "zipcode#index", as: "zipcode"
  #   get "/zipcode" => "zipcode#index"
  root "home#index"
end
