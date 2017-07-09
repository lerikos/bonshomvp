Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations" }
  root 'pages#home'

  get 'alerts', to: 'alerts#alerts'
  resources :alerts
  resources :users, except: [:new]
end
