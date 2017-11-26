Rails.application.routes.draw do
  get 'users/downgrade', to: 'users#downgrade'

  post 'users/downgrade', to: 'users#perform_downgrade'

  devise_for :users

  resources :users

  resources :wikis

  resources :charges, only: [:new, :create]

  resources :wikis do
    resources :collaborations, only: [:create, :destroy]
  end

  root 'wikis#index'

end
