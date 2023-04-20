Rails.application.routes.draw do
  root "homes#index"

  get "/login", to: "homes#login"

  post "/logout", to: "users#logout"

  resources :users
end
