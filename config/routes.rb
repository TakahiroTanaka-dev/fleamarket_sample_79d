Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  # before

  get 'items/index'
  # after
  root 'items#index'

  resources :items, only: [:index, :show, :new, :create, :destroy] do
    resources :transacts, only: [:index, :set_item] do
      collection do
        get 'done', to: 'transacts#done'
        post 'pay', to: 'transacts#pay'
      end
    end
  end

  resources :users, only: :show do
    member do
      get 'log_out'
    end
  end

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :transacts
  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end

end