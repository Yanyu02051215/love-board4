Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  
  resources :questions 
  resources :answers, only: [:create, :edit, :update, :destroy]
  get "/questions/:id/answers/new", to: "answers#new"
  post "/questions/:id/answer", to: "answers#create"
  post "/answers/:id/is_best", to: "answers#is_best"
  resources :users, only: [:show, :edit, :update]
  resources :reactions, only: [:edit, :update, :destroy]
  post "/answers/:id/reaction", to: "reactions#create"
  post "/questions/:id/bookmark", to: "bookmarks#create"
  delete "/bookmarks/:id", to: "bookmarks#destroy"
  get "questions/test", to: "questions#test" 
end
