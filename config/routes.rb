Todos::Application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'homepage'
  resources :todos, only: [:index, :new, :create] do
    resource :completion, only: [:create, :destroy]
  end
  resource :session, only: [:new, :create, :destroy]
end
