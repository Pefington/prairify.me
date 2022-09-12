Rails.application.routes.draw do
  namespace :admin do
    root 'dashboard#index'
    resources :projects
    resources :users
  end
  resources :project_updates
  root 'static_pages#home'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :projects do
    resources :project_updates
  end
  resources :search, only: %i[index]
  resources :likes, only: %i[create destroy]
  resources :favourites, only: %i[index create destroy]

  scope '/', controller: :static_pages do
    get :team, :about, :contact, :profile
  end
end
