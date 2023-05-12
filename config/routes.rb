Rails.application.routes.draw do
  root "homes#index"
  devise_for :users

  get "/users/" => "users#index"

end
