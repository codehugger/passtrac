Rails.application.routes.draw do
  get 'dashboard/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :assets, only: [:new, :create] do
    resources :positions, only: [:new, :create]
  end

  resources :assets, except: [:new, :create]
  resources :positions, only: [:show, :index]

  root "dashboard#index"
end
