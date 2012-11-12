require 'spec_helper'

describe Todo, '#owner=' do
  it 'assigns user email to owner_email' do
    user = User.new('person@example.com')
    todo = Todo.new
    todo.owner = user
    expect(todo.owner_email).to eq 'person@example.com'
  end
end
