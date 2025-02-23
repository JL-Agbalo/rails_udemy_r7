Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  # Sign up: admins/registrations
  # Sign in: admins/sessions

  get "customers/edit_customer", to: "customers#edit_customer", as: "edit_customer"
  post "customers/manager_customer", to: "customers#manage_customer", as: "manage_customer"
  resources :roles
  resources :staff_user
  resources :customers, only: [:edit, :update]
  resources :dashboard, only: [:index]
  root "dashboard#index"


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

  resources :users 

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

  get "/shoppingcart/index" => "shoppingcart#index"
  get "/shoppingcart/product_list" => "shoppingcart#product_list"
  get "/shoppingcart/:product_id/add_cart" => "shoppingcart#add_cart", as: :add_cart
  get "/shoppingcart/:product_id/remove_cart" => "shoppingcart#remove_cart", as: :remove_cart

  resources :employeespaginations, only: [:index]

  get 'radio_index', to: 'allowances#radio_index'
  post 'radio_create', to: 'allowances#radio_create'

  get 'check_box_index', to: 'allowances#check_box_index'
  post 'check_box_create', to: 'allowances#check_box_create'

  get 'list_box_index', to: 'allowances#list_box_index'
  post 'list_box_create', to: 'allowances#list_box_create'

  resources :employeefilters, only: [:index]

  resources :transfers, except: [:show, :edit, :update]
  resources :belfastemployees, only: [:index]
  # root "belfastemployees#index"

  get "belfastemployees/export_as", to: "belfastemployees#export_as", as: :export_as

  resources :employeeinfodetails, only: [:index, :show, :new, :create]
  # root "employeeinfodetails#index"

  # root "charts#index"
  get "charts/fetch_sales_data" => "charts#fetch_sales_data"

  get "home" => "employees#home"
  get "session_test" => "employees#session_test"
  get "readsessiondata" => "employees#readsessiondata"

  resources :employees, only: [:index, :show]
  # root "employees#emp_idx"
  get "home" => "employees#home"
end