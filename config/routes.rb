Todos::Application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'homepage'
  resources :todos, only: [:index, :new, :create]
  resource :session, only: [:new, :create]
end
