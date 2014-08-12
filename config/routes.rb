Dias::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :projects
  

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users

  resources :users do
    member do
      get :follow
      get :unfollow
    end
  end

  resources :projects do
    member do
      get :follow
      get :unfollow
    end
  end
  

  get "about" => "pages#about"
  get "faq" => "pages#faq"
  get "team" => "pages#team"
  get "partners" => "pages#partners"
  get "manifesto" => "pages#manifesto"
  get "membership" => "pages#membership"
  get "fonctionnement" => "pages#fonctionnement"
end