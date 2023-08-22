Rails.application.routes.draw do
  get 'postulation/index'
  resources :offers
 
  devise_for :btousers

  root  "pages#home"
  post '/reactions', to: 'reactions#user_reaction', as: 'user_reaction'
  

  resources :admin, only: [:index, :create, :update ]

end
