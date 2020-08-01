Rails.application.routes.draw do
  resources :users do
  	resources :hints, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:destroy]
  resources :sessions, :path => "login" , only: [:new, :create]
end
