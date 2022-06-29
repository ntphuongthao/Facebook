Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',  omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users
  root 'application#home'

  scope '/friends', as: :friends do
    get 'find', to: 'users#find_friends'
    get 'requests', to: 'users#friend_requests'
  end

  resources :friend_requests, only: :create do
    member do
      post 'confirm'
      delete 'delete'
    end
  end
end
