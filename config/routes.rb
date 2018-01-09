Rails.application.routes.draw do
  get 'users/downgrade', to: 'users#downgrade'

  post 'users/downgrade', to: 'users#perform_downgrade'

  devise_for :users

  resources :users

  resources :wikis do
    resources :collaborators
  end

  resources :charges, only: %i[new create]

  root 'wikis#index'
end
