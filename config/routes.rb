Rails.application.routes.draw do
  post "/zipcode" => "home#zipCode", as: "zipcode"
  # get "/home/zipcode" => "home#zipcode", as: "home_zipcode"
  root "home#index"
end
