Rails.application.routes.draw do

  devise_for :users
 
  get 'home/index'
  root to: "home#index"
  
  get 'pilotes/index'

  
  resources :licences
  resources :divisions
  resources :saisons
  resources :equipes
  resources :ecuries

  resources :events
  resources :circuits
  resources :pilotes
  
  resources :resultats

  resources :classecuries
  resources :classements

end
