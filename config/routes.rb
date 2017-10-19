Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources "contacts", only: [:new]
  get "/pages/:page" => "pages#show"
  root "pages#index", page: "home"
end
