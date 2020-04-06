Rails.application.routes.draw do
  devise_for :users
  resources :users, except: %i[index new create] do
    resources :orders do
      resources :item_orders
    end
  end
        resources :items
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
