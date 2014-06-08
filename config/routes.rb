Dias::Application.routes.draw do
  resources :projects
  

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users
  

  get "about" => "pages#about"
  get "faq" => "pages#faq"
  get "team" => "pages#team"
  get "partners" => "pages#partners"
  get "manifesto" => "pages#manifesto"
  get "membership" => "pages#membership"
end