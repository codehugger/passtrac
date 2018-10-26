Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :assets, only: [:new, :create] do
      resources :positions, only: [:new, :create]
    end
  end

  resources :assets, except: [:new, :create]
  resources :positions, only: [:show, :index]

  root "companies#index"
end
