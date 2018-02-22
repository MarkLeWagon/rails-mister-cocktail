Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"

  resources :cocktails, except: [:edit, :update, :destroy]
  resources :ingredients, only: [:create, :new, :delete]
  resources :doses, only: [:create, :new, :delete, :index]
end
