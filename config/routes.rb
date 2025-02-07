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
  
  # Define individual routes for employees
  get "employees", to: "employees#index", as: :employees
  get "employees/new", to: "employees#new", as: :new_employee
  post "employees", to: "employees#create"
  get "employees/:id/edit", to: "employees#edit", as: :edit_employee
  get "employees/:id/delete", to: "employees#delete", as: :delete_employee
  get "employees/:id", to: "employees#show", as: :employee
  patch "employees/:id", to: "employees#update"
  delete "employees/:id", to: "employees#destroy"


  resources:users 

  resources :singleemployeedelete, only: [:index] do
    delete 'emp_delete', on: :collection
  end

  resources :bulkdeleteemployees, only: [:index] do
    delete 'bulk_delete', on: :collection
  end

  resources :bulkupdates, only: [:index] do
    collection do
      patch 'bulk_update', to: 'bulkupdates#bulk_update'
    end
  end

  resources :bulkinserts, only: [:new, :create]
  
  resources :offshoreemployees do
    collection do
      get 'get_states'
      get 'get_cities'
    end
  end
end