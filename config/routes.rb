Rails.application.routes.draw do
  root to: "site#index"

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :skills, only: [:show]
  end
  # get "/login", to: "sessions#new"
  # get '/logout', to: "sessions#destroy"
  # post "/sessions", to: "sessions#create"

  # get "/posts", to: "posts#index", as: "posts"
  # get "/posts/:id", to: "posts#show", as: "post"
  # get "/posts/:id/edit", to: "posts#edit", as: "edit_post"
  # patch "/posts/:id", to: "posts#update"
  # delete "/posts/:id", to: "posts#destroy"

  # get "/cities/:name/posts/new", to: "posts#new", as: "new_post"
  # post "/cities/:name/posts", to: "posts#create", as: "cities_posts"

  # get "/cities", to: "cities#index"
  # get "/cities/:name", to: "cities#show", as: "city"
end
