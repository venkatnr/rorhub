Rorhub::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :users do
	resources :articles
  end
  
  resources :articles do 
		resources :comments
	end
 
  root :to => 'articles#index'	

end
