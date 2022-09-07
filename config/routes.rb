Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :projects
  scope '/', controller: :static_pages do
    get :team, :about, :contact, :blog
  end
  resources :search, only: %i[index]
end
