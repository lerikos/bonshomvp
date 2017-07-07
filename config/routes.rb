Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations" }
  root 'pages#home'

  get 'alerts', to: 'alerts#alerts'
  resources :alerts
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
