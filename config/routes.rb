Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dream_tags
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
