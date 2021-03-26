Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'


    root to: 'tasks#index'
    resources :tasks

#ログイン
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
#サインアップ    
  get 'signup', to: 'users#new'
    resources :users, only: [:create]
    
    
 end
