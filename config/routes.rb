Rails.application.routes.draw do
  get 'enquiries/new'

  get 'enquiries/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contacts, only: [:new, :create]
  resources :enquiries, only: [:new, :create]
  root 'contacts#new'
end
