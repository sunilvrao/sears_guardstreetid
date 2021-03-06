Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
#match '/', to: 'home#index', constraints: { subdomain: /.+/ }, via: [:get, :post, :put, :patch, :delete]
  resources :home do
	collection do
	  post 'submit_coupon'
	  get 'shopping_cart'
          post 'submit_cart'
	  post 'register'
	  get 'login'
	  post 'sign_in'
	end
  end
  resources "carts", only: [:index, :show, :create, :destroy]
  resources "contacts", only: [:new, :create, :resume]
  post 'contact', :to => 'contacts#create', :as => 'submit_contact_form'
end
