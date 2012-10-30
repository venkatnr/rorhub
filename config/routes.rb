Rorhub::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :homes

  root :to => 'homes#index'

end
