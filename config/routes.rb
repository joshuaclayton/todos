Todos::Application.routes.draw do
  root to: 'high_voltage/pages', action: :show, id: 'homepage'
  resource :session, only: [:new, :create, :destroy]
  resources :todos, only: [:index, :new, :create] do
    resource :completion, only: [:create]
  end
end
