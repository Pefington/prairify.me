Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :search, only: %i[index]
  resources :like, only: %i[new create destroy]
  scope '/', controller: :static_pages do
    get :team, :about, :contact
  end
end
