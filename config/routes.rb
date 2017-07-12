Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  root 'pages#home'

  get 'alerts', to: 'alerts#alerts'
  get 'subscribe', to: 'users#subscribe'
  post '/follow-to-tag', to: 'users#check_tag_follow'
  resources :alerts
  resources :products
  resources :tags
  resources :users, except: [:new]
end
