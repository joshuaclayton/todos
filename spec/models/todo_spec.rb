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

describe Todo, 'completed?' do
  it 'returns true when completed_at is set' do
    todo = Todo.new
    todo.completed_at = Time.now
    expect(todo).to be_completed
  end

  it 'returns false when completed_at is not set' do
    todo = Todo.new
    expect(todo).to_not be_completed
  end
end
