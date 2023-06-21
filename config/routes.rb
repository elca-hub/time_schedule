Rails.application.routes.draw do
  root "homes#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  get "/users/" => "users#index"

  get "/users/send_mail/" => "users#send_mail"

  scope '/users' do
    resources :tasks
    resources :tags
  end
end
