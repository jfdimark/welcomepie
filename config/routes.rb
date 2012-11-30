Welcomepie::Application.routes.draw do

	resources :friends, :controller => 'friendships', :except => [:show, :edit] do
 	 	get "requests", :on => :collection
  	get "invites", :on => :collection
  	#match '/new', to: 'users#show'
    resources :messages, only: [:new, :create]
  end

  resources :messages, only: [:index, :show, :destroy] do 
    member do
      post 'reply'
    end
  end

  #resources :friendships
		
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => :registrations }
  resources :users
end
