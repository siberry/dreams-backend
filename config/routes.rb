Rails.application.routes.draw do
  resources :follows
  get "/dream_tags/alpha/:letter", to: "dream_tags#get_dreams_by_letter"
  # resources :specific_dream_tags
  resources :dreams, only: [:index, :create, :show, :update]
  resources :users, only:[:index, :show, :create]
  get "/users/:id/dreams", to: "users#get_user_dreams"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dream_tags, only:[:index, :show, :update, :create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
