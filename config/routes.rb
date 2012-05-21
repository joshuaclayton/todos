Todos::Application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'homepage'
  resource :sessions, only: [:create]
  resources :todos, only: [:index, :new, :create]
end
