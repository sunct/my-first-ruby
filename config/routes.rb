Rails.application.routes.draw do
  get 'sessions/new'

  resources :myblogs
  resources :users
  get 'welcome/index'
  get  '/about',to:'welcome#about'
  get  '/connect',to:'welcome#connect'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'welcome#index'
  get  '/signup',  to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
