Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #Home
  root "main#index"


  #Authentication

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update", as: :password

  get "/register", to: "authentication#register_user"
  post "/register", to: "authentication#create_user"
  get "/register/dentist", to: "authentication#register_dentist"
  post "/register/dentist", to: "authentication#create_dentist"

  get "/login", to: "sessions#new_user"
  post "/login", to: "sessions#create_user"
  get "/login_dentist", to: "sessions#new_dentist"
  post "/login_dentist", to: "sessions#create_dentist"

  get "password/reset", to: "password_reset#new"
  post "password/reset", to: "password_reset#create"
  get "password/reset/edit", to: "password_reset#edit", as: :edit_password_reset
  patch "password/reset/edit", to: "password_reset#update"

  delete "/logout", to: "sessions#destroy_user"
  delete "/logout_dentist", to: "sessions#destroy_dentist"

  #Appointment

  get 'dentists/dashboard', to: 'dentists#dashboard', as: 'dentists_dashboard'
  get 'users/dashboard', to: 'users#dashboard', as: 'users_dashboard'

  get "/home", to: "home#index"
  resources :appointments, controller: 'home', only: [:new, :create, :show, :edit, :update]
  resources :users
  resources :dentists

  resources :appointments do
    member do
    patch 'approve'
    patch 'cancel'
    end
  end


  resources :dentists do
    collection do
        get :dashboard
    end
  end

  resources :users do
    collection do
      get :dashboard
    end
  end


end


