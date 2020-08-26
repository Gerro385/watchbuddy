Rails.application.routes.draw do
  get 'media/show'
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :media, only: %i[index show create]
  resources :users, only: %i[index show] do
    resources :watches, only: %i[index create update destroy]
  end
end
