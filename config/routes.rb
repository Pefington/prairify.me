Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :projects
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :search, only: %i[index]
  resources :like, only: %i[new create destroy]
  scope '/', controller: :static_pages do
    get :team, :about, :contact, :blog
  end
end
