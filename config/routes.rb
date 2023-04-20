Rails.application.routes.draw do
  root "homes#index"

  get "/login", to: "homes#login"

  post "/logout", to: "users#logout"

  get "/users/login", to: "users#login"

  post "/users/login", to: "users#login_check"

  resources :users
end
