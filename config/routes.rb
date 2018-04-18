Rails.application.routes.draw do

 get '/reservations/:id/braintree/new' => "braintree#new", as: "braintree_new"
 post '/reservations/:id/braintree/checkout' => "braintree#checkout", as: "braintree_checkout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#show"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :listings do
  	resources :reservations, only: [:create]
  end

  get "/searchresult" => "listings#searchresult"

  
end
