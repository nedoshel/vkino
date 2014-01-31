Vkino::Application.routes.draw do
  root 'home#index'

  resources :films
  resources :persons

  get '/search' => 'home#index', as: :search
end
