Vkino::Application.routes.draw do
  root 'home#index'

  resources :films do
    collection do
      get '/parse' => 'films#parse'
      get '/f/:filter' => 'films#index', as: :filter
    end
  end
  resources :persons, as: :tags do
    collection do
      get '/f/:filter' => 'persons#index', as: :filter
    end
  end
  resources :persons, only: [:show, :edit, :index]

  post '/views/:viewable_type/:viewable_id' => 'views#create', as: :views
  delete '/views/:viewable_type/:viewable_id' => 'views#destroy', as: :view

  get '/search' => 'home#search', as: :search
end
