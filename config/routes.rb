Rails.application.routes.draw do
  
    root to: 'pages#home'
    # is the 'users/registrations' talking about the controller or view file?
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :users do
      resource :profile
      resources :goals do
        resources :comments
      end
    end
    get '/about', to: 'pages#about'
    resources :contacts, only: :create
    get '/contact-us', to: 'contacts#new', as: 'new_contact'
    
    
end
