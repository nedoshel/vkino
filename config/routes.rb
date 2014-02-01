Vkino::Application.routes.draw do
  root 'home#index'

  resources :films
  resources :persons
  resources :views, only: [:create, :destroy]

  get '/search' => 'home#index', as: :search
end
