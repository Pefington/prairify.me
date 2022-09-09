Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :projects
  resources :search, only: %i[index]
  resources :likes, only: %i[create destroy]
  resources :favourites, only: %i[create destroy]
  scope '/', controller: :static_pages do
    get :team, :about, :contact, :profile
  end
end
