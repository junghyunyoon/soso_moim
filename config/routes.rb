SosoMoim::Application.routes.draw do
  resources :users  do
        member do
          get :attending, :managed
        end
      end
  
  resources :sessions, :only => [:new, :create, :destroy]
  resources :moims do
      member do 
          get :attendees
      end
  end
  resources :attendances, :only => [:create, :destroy]
  
  
  match '/signup',  :to => 'users#new'

  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  
  get "pages/home"
  get "pages/contact"
  get "pages/about"
  
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  
  root :to => 'moims#index'
  
end
