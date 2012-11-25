	Welcomepie::Application.routes.draw do



		resources :friendships
		resources :inverse_friendships

	  authenticated :user do
	    root :to => 'home#index'
	  end
	  root :to => "home#index"
	  devise_for :users, :controllers => { :registrations => :registrations }
	  resources :users
	end