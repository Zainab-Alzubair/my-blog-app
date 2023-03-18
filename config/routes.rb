Rails.application.routes.draw do
  get 'users/:user_id/posts', to: 'posts#index', :as => 'user_posts'
  get 'users/:user_id/posts/:id', to: 'posts#show', :as => 'user_post'
  root 'users#index'
  get "/users/:id", to: "users#show", :as => 'user'
end
