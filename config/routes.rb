Vkino::Application.routes.draw do
  root 'home#index'

  resources :films do
    collection do
      get '/parse' => 'films#parse'
      get '/f/:filter' => 'films#index', as: :filter
    end
  end
  resources :persons

  post '/views/:viewable_type/:viewable_id' => 'views#create', as: :views
  delete '/views/:viewable_type/:viewable_id' => 'views#destroy', as: :view

  get '/search' => 'home#index', as: :search
end
