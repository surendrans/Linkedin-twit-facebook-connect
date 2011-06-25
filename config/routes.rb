Connect::Application.routes.draw do
  resources :authentications

  devise_for :users,    :controllers =>{:registrations => 'registrations'}

  resources :products
  match '/auth/:provider/callback' => 'authentications#create'
  root :to => "products#index"
end
