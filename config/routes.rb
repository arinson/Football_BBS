Rails.application.routes.draw do
  get "topics/new"
  devise_for :users
  root "pages#index"
  get "pages/show"

  resources :topics

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
