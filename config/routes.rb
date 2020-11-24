Rails.application.routes.draw do
  devise_for :users

  get "users/:id/show" => "users#show"

  #pages
  root "pages#index"
  get "pages/show"

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :topics, only: [:index, :create, :new, :edit, :show, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end

  get "likes/index"
  post "/likes", to: "likes#create"
  delete "/likes", to: "likes#destroy"

  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
