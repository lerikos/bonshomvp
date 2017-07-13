Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  root 'pages#home'

  get 'alerts-listing', to: 'users#alerts'
  get 'subscribe', to: 'users#subscribe'
  get '/profile', to: 'users#profile'
  post '/follow-on-tag', to: 'users#check_tag_follow'
  post '/follow-on-product', to: 'users#check_product_follow'
  post '/search', to: 'users#search'
  resources :alerts
  resources :products
  resources :tags
  resources :users, except: [:new]
end
