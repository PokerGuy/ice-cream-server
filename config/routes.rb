Rails.application.routes.draw do

  #devise_for :user, only: []
  namespace :v1, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
    get '/flavors_admin', to: 'flavors#admin_index'
    get '/flavors_all', to: 'flavors#all'
    resources :flavors, only: [:create, :index, :show, :update]
    resources :nonce, only: [:index]
    resources :order, only: [:create, :update, :index]
    resources :donation, only: [:create, :index]
    get 'donations_listen', to: 'donation#listen'
    resources :blog, only: [:index, :show]
  end
end
