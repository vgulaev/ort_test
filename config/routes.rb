Rails.application.routes.draw do
  get 'api/server'
  get 'api/bandwidth'
  get 'server/index'
  resources :server
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'server#index'
end
