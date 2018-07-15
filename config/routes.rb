Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :songnotes
  resources :pieces
  resources :events
  resources :notes

  root 'timeline#index'

  get '/timeline/', to: 'timeline#index'
  get '/quotes/', to: 'quote#index'
  get '/songs/', to: 'songs#index'

  get '/songs/:id/:pages', to: 'scoreview#show'
  get '/pieces/:id/:pages', to: 'scoreedit#show'
end
