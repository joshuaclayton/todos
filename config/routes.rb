Todos::Application.routes.draw do
  root to: 'high_voltage/pages', action: :show, id: 'homepage'
  resource :session, only: [:new, :create]
end
