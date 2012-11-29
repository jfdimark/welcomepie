	Welcomepie::Application.routes.draw do

	resources :friends, :controller => 'friendships', :except => [:show, :edit] do
 	 	get "requests", :on => :collection
  	get "invites", :on => :collection
  	get "new_message", :on => :collection
    post "create_message", :on => :collection
  	#match '/new', to: 'users#show'
  end

  #resources :friendships
		
	  authenticated :user do
	    root :to => 'home#index'
	  end
	  root :to => "home#index"
	  devise_for :users, :controllers => { :registrations => :registrations }
	  resources :users
	end