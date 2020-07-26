Rails.application.routes.draw do
  # before
get 'items/index'
# after
root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :transacts
resources :addresses
resources :cards
end
