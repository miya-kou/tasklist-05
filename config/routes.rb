Rails.application.routes.draw do
  get 'helps/show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root to: 'tasks#index'
  get 'signup', to: 'users#new'
  get 'indexfinish', to: 'tasks#indexfinish'
  resources :tasks
  resources :users, only: [:new, :create]
end
