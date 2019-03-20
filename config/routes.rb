Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :orders do
  	resources :messages
  end

  scope '(:locale)' do
    resources :orders
    resources :users
    root "orders#index"
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
