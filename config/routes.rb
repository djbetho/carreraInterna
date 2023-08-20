Rails.application.routes.draw do
 
  devise_for :btousers

  root  "pages#home"

  resources :admin, only: [:index, :create, :update ]

end
