Todos::Application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'homepage'
  resource :session, only: [:create]
end
