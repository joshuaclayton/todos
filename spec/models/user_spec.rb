require 'spec_helper'

describe User, '#todos' do
  it 'returns todos only for the user based on email' do
    todo_owned_by_user = Todo.create! owner_email: 'me@example.com'
    todo_not_owned_by_user = Todo.create! owner_email: 'not_me@example.com'

    user = User.new('me@example.com')
    todos = user.todos

    expect(todos).to eq [todo_owned_by_user]
  end
end
