Rails.application.routes.draw do
  resources :records
  root to: redirect('/records')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
