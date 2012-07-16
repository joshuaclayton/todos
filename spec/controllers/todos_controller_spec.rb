require 'spec_helper'

describe TodosController, '#index' do
  context 'not signed in' do
    it 'redirects me to create a new session' do
      get :index
      should redirect_to(new_session_path)
    end
  end

  context 'signed in' do
    before do
      controller.current_email = 'john@example.com'
    end

    it 'responds successfully' do
      get :index
      should respond_with(:success)
    end
  end
end
