Rails.application.routes.draw do
  resources :articles do
    resources :comments
    get '/comments/:id/new', to: 'comments#new', as: 'new_comment_reply'
    post '/comments/:id/new', to: 'comments#create'
  end
  resources :users

  root :to => redirect('/articles')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: 'users#login'
  post '/login', to: 'users#signin'
  post '/logout', to: 'users#logout'
end
