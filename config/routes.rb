Rails.application.routes.draw do
  root "homes#index"

  get "/login", to: "homes#login"

  resources :users
end
