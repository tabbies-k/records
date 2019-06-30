Rails.application.routes.draw do
    root 'static_pages#home'
  get 'static_pages/home'
  devise_for :users
  resources :records
  get 'users' => "users#index"
  get 'users/:id' => "users#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
