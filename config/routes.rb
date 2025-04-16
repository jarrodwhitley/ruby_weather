Rails.application.routes.draw do
  post "/aqi/results" => "aqi#search", as: "aqi_results"
  get "/aqi" => "aqi#show", as: "aqi_search"
  root "home#index"
end
