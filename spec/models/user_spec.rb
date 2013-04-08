require 'spec_helper'

describe User, '#todos' do
  it 'returns todos for the user' do
    user = User.new('person@example.com')
    todo = Todo.new
    todo.owner = 'person@example.com'
    todo.save!

    Todo.create! do |todo|
      todo.owner = 'someone-else@example.com'
    end

    expect(user.todos).to eq [todo]
  end
end
