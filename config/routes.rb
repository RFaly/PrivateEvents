Rails.application.routes.draw do
  devise_for :users
  root 'events#index'

  resources :events do
    member do
      post 'attend'
      delete 'unattend'
    end
  end

  resources :users, only: [:show]
end
