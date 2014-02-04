Vkino::Application.routes.draw do
  root 'home#index'

  resources :films do
    collection do
      get '/parse' => 'films#parse'
    end
  end
  resources :persons
  #resources :views, only: [:create, :destroy]

  post '/views/:viewable_type/:viewable_id' => 'views#create', as: :views
  delete '/views/:viewable_type/:viewable_id' => 'views#destroy', as: :view

  get '/search' => 'home#index', as: :search
end
