Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  scope '(:locale)', locale: /en|fr/ do
    namespace :admin do
      root 'dashboard#index'
      resources :projects, only: %i[index edit update destroy]
      resources :users, only: %i[index new edit update create destroy]
      resources :comments, only: %i[index edit update destroy]
    end
    resources :project_updates
    root 'static_pages#home'
    post '/selected_plants/reset', to: 'selected_plants#reset'
    devise_for :users, skip: :omniauth_callbacks, controllers: {
      registrations: 'users/registrations'
    }
    resources :projects do
      resources :project_updates, only: %i[new create destroy]
      resources :comments, only: %i[new create destroy]
    end

    resources :selected_plants
    resources :likes, only: %i[create destroy]
    resources :favourites, only: %i[index create destroy]
    resources :search, only: %i[index]

    scope '/', controller: :static_pages do
      get :team, :about, :contact, :profile
    end
  end
end
