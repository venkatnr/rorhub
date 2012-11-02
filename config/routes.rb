Rorhub::Application.routes.draw do

  	get "aboutme/index"


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :users do
	resources :articles
  end
  
  resources :articles do 
		resources :comments	
	end
 resources :comments	do
	collection do
	get 'approve'
	end
	end
  root :to => 'articles#index'	

end
