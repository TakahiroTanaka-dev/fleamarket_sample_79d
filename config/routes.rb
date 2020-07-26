Rails.application.routes.draw do
  # before
get 'items/index'
# after
root 'items#index'

resources :items, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
