Rails.application.routes.draw do

  resources :entries
    root 'static_pages#home'
    get 'static_pages/home'
    get 'static_pages/about'
    
    devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :passwords => 'users/passwords'
  }
  
    devise_scope :user do
    get 'my_page' => 'users/registrations#my_page'
end
 
    resources :records
    get 'users' => "users#index"
    get 'users/:id' => "users#show"
    
    resources :targets
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
