Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup' , to: 'users#new'
  get    'login'    => 'sessions#new'
  post   'login'    => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  
  resources :users do
    member do
      get 'followers', 'followings', 'favorites'
    end
  end
  
end
