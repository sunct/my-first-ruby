Rails.application.routes.draw do
  resources :myblogs
  resources :users
  get 'welcome/index'
  get  '/about',to:'welcome#about'
  get  '/connect',to:'welcome#connect'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
