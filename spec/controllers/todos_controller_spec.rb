require 'spec_helper'

describe TodosController, '#index' do
  context 'not signed in' do
    it 'assigns @todos as an empty array' do
      get :index
      should assign_to(:todos).with([])
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

    it 'assigns @todos' do
      get :index
      should assign_to(:todos)
    end
  end
end
