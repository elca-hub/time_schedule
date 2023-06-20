Rails.application.routes.draw do
  root "homes#index"
  devise_for :users, controllers: {   registrations: 'users/registrations' }

  get "/users/" => "users#index"

  scope '/users' do
    resources :tasks
    resources :tags
  end
end
