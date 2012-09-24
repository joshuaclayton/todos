require 'spec_helper'

describe Todo, '#user=' do
  it 'assigns the passed object email as owner_email' do
    todo = Todo.new
    todo.user = User.new('person@example.com')
    expect(todo.owner_email).to eq 'person@example.com'
  end
end
