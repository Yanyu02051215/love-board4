Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  get "questions/:gender/select", to: "questions#gender"
  get "questions/:age/age", to: "questions#age"
  get "questions/:category/category", to: "questions#category"
  get "questions/userrank", to: "questions#userrank"
  get "questions/rank", to: "questions#rank"
  get "questions/pvrank", to: "questions#pvrank"
  get "users/:id/post", to: "users#post"
  resources :questions do
    resources :answers, only:[:create, :new]
  end
  resources :answers, only: [:edit, :update, :destroy] do
    member do
      post :is_best
    end
    resources :reactions , only: [:create]
  end

  resources :users, only: [:show, :edit, :update]
  resources :reactions, only: [:edit, :update, :destroy]
  # post "/answers/:id/reaction", to: "reactions#create"
  post "/questions/:id/bookmark", to: "bookmarks#create"
  delete "/bookmarks/:id", to: "bookmarks#destroy"
end