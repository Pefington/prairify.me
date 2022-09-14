Rails.application.routes.draw do
  root 'static_pages#home'
  post '/selected_plants/reset', to: 'selected_plants#reset'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
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
