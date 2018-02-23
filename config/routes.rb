Rails.application.routes.draw do
  root to: "site#index"

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :skills, only: [:show]
  end

  get "/login", to: "sessions#new"
  get '/logout', to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  get "/skills", to: "skills#index", as: "skills"
  get "/skills/:id", to: "skills#show", as: "skill"
  get "/skills/:id/edit", to: "skills#edit", as: "edit_skill"
  patch "/skills/:id", to: "skills#update"
  delete "/skills/:id", to: "skills#destroy"

  get "/categories/:name/skills/new", to: "skills#new", as: "new_skill"
  post "/categories/:name/skills", to: "skills#create", as: "categories_skills"

  get "/categories/new", to: "categories#new", as: "new_category"
  post "/categories", to: "categories#create"

  get "/categories", to: "categories#index"
  get "/categories/:name", to: "categories#show", as: "category"






end
