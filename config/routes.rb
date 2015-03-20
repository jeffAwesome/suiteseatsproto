Rails.application.routes.draw do
  devise_for :users
  resources :guest_seats

  resources :seats

  resources :order_items

  resources :orders

  get 'orders/:id/tip', to: 'orders#tip'

  get 'pages/home' => 'high_voltage/pages#show', id: 'home'

  authenticated :user do
    # Rails 4 users must specify the 'as' option to give it a unique name
    root :to => "pages#show", id: 'venue', :as => "authenticated_root"
  end

  root to: 'pages#show', id: 'home'


end
