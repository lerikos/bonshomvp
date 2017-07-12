Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  root 'pages#home'

  get 'alerts', to: 'alerts#alerts'
  resources :alerts
  resources :products
  resources :tags
  resources :users, except: [:new]
end
