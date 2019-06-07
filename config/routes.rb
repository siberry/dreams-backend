Rails.application.routes.draw do
  get "/dream_tags/:letter", to: "dream_tags#get_dreams_by_letter"
  resources :specific_dream_tags
  resources :dreams
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dream_tags
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
