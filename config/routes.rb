Rails.application.routes.draw do
  root "homes#index"
  devise_for :users

  get "/users/show" => "users#show"

end
