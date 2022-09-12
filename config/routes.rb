Rails.application.routes.draw do
  resources :selected_plants
  resources :project_updates
  root 'static_pages#home'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :projects do
    resources :project_updates, only: %i[index new create destroy]
    resources :comments, only: %i[index new create destroy]
  end

  resources :likes, only: %i[create destroy]
  resources :favourites, only: %i[index create destroy]
  resources :search, only: %i[index]

  scope '/', controller: :static_pages do
    get :team, :about, :contact, :profile
  end
end
