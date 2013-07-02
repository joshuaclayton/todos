Todos::Application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'homepage'
  resource :session, only: [:create]
  resources :todos, only: [:index, :create] do
    resource :completion, only: [:create, :destroy]
  end
end
