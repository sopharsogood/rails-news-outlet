Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: 'users#login'
  post '/login', to: 'users#signin'
  post '/logout', to: 'users#logout'
end
