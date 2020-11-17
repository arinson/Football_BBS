Rails.application.routes.draw do
  devise_for :users
  resources :users

  get "users/:id/show" => "users#show"

  #pages
  root "pages#index"
  get "pages/show"

  #topics
  get "topics/new"

  resources :topics do
    resources :comments, only: [:create, :destroy]
  end

  get "likes/index"
  post "/likes", to: "likes#create"
  delete "/likes", to: "likes#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
