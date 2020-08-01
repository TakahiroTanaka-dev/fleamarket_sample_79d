Rails.application.routes.draw do
  devise_for :users
  # before

get 'items/index'
# after
root 'items#index'

resources :items, only: [:index, :show, :new, :create]



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :transacts
resources :addresses
resources :cards, only: [:new, :show, :destroy] do
  collection do
    post 'pay', to: 'cards#pay'
  end
end

end