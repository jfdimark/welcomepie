Welcomepie::Application.routes.draw do

	get 'tag_data/find_tags'

	devise_for :users
  resources :users
  
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

end