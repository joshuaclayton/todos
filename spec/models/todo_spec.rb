require 'spec_helper'

describe Todo, 'validations' do
  it { should validate_presence_of(:title) }
end

describe Todo, 'user=' do
  it 'assigns owner_email as user.email' do
    email = 'john@example.com'
    user = User.new(email)

    todo = Todo.new
    todo.user = user
    expect(todo.owner_email).to eq email
  end
end
