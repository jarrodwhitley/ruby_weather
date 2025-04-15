Rails.application.routes.draw do
  post "/zipcode" => "zipcode#index", as: "zipcode"
  root "home#index"
end
