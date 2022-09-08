Rails.application.routes.draw do
  resources :projects
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :search, only: %i[index]
  resources :like, only: %i[new create destroy]
end
