Rails.application.routes.draw do
  

  scope '(:locale)' do
  	resources :orders
  	root "orders#index"
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
