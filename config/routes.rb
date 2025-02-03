Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "home/getQueryStringValues" => "home#getQueryStringValues"
  get "home/getPassDataToViews" => "home#getPassDataToViews"
  get "home/showDateTimeInfo" => "home#showDateTimeInfo"
  get "home/conditionalRendering" => "home#conditionalRendering"
  get "home/loopThoughArrays" => "home#loopThoughArrays"
  get "home/index" => "home#index"
  get "home/load_users" => "home#load_users"
  get "home/load_users_wimage" => "home#load_users_wimage"
  get "home/load_user_details/:id" => "home#load_user_details", as: :load_user_details
  get "home/show_user_details" => "home#show_user_details"
  

end
