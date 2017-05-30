Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	devise_scope :user do
	  root to: "devise/sessions#new"
	  match '/users/sign_out' => 'devise/sessions#destroy', via: [:get, :delete]
	end

	get 'member', to: 'user#member', as: :member
	get 'admin', to: 'user#admin', as: :admin
	get 'dashboard', to: 'user#dashboard', as: :dashboard
	post 'user/invite',  to: 'user#add_user', as: :invite

	get 'home', to: 'home#home'



end
