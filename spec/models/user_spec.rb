require 'spec_helper'

describe User do
  context '#email' do
    it 'returns the email address from when the user is instantiated' do
      email_address = 'john@example.com'
      user = User.new(email_address)
      user.email.should == email_address
    end
  end

  context '#signed_in?' do
    it 'returns true' do
      email_address = 'john@example.com'
      user = User.new(email_address)
      user.should be_signed_in
    end
  end

  context '#todos' do
    it 'returns only todos the user owns' do
      todo_user_owns = create_todo_owned_by 'john@example.com'
      todo_user_doesnt_own = create_todo_owned_by 'jane@example.com'

      user = User.new('john@example.com')
      user.todos.should == [todo_user_owns]
    end

    def create_todo_owned_by(email)
      Todo.new(description: 'get milk').tap do |todo|
        todo.owner_email = email
        todo.save
      end
    end
  end
end
