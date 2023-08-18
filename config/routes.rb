Rails.application.routes.draw do
  resources :bowlings do
  member do
    get 'adding', to: "bowlings#adding"
    patch 'adding', to: "bowlings#add" 
  end
end
  resources :battings do
  member do
    get 'adding', to: "battings#adding"
    patch 'adding', to: "battings#add" 
  end
end
  get 'search', to: "search#index"

  resources :players do
    resources :comments
  end
  get 'home', to: "pages#home"
  get 'about', to: "pages#about"

  delete 'logout', to: "sessions#destory"

  get 'sign_up', to: "registrations#new"
  post 'sign_up',   to: "registrations#create"

  get 'sign_in', to: "sessions#new"
  post 'sign_in',   to: "sessions#create"


  get "password", to: "passwords#edit"
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

 


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
