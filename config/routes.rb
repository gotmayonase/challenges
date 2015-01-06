Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :challenges do
    resources :entries, only: [:create, :destroy]
  end
  resources :tasks

  root 'home#index'
end
