Rails.application.routes.draw do
  get 'media/show'
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile'
  get 'profile/watchlist', to: 'pages#watchlist'
  get 'profile/favourites', to: 'pages#favourites'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :media, only: %i[index show create]
  resources :users, only: %i[index show] do
    resources :watches, only: %i[index create update destroy]
    get '/watchlist', to: 'users#watchlist'
    get '/seen', to: 'users#seen'
    get '/buddies', to: 'requests#buddies'
    resources :requests, only: %i[create update]
  end
  get '/like/:medium_id', to: 'watches#favourite', as: 'like'
end
