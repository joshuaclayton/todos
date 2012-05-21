require 'spec_helper'

describe User do
  context '#email' do
    it 'has the email it was instantiated with' do
      user_with_email = User.new('person@example.com')
      user_with_email.email.should == 'person@example.com'
    end
  end

  context '#todos' do
    it 'returns only todos belonging to the user' do
      current_user = User.new('person@example.com')
      different_user = User.new('different@example.com')

      Todo.create(name: 'Todo 1', user: current_user)
      Todo.create(name: 'Todo 2', user: current_user)

      Todo.create(name: 'Todo 3', user: different_user)

      current_user.todos.map(&:name).should == ['Todo 1', 'Todo 2']
    end
  end

  context '#signed_in?' do
    it 'is true' do
      user = User.new('person@example.com')
      user.should be_signed_in
    end
  end
end
