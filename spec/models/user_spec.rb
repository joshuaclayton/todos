require 'spec_helper'

describe User, '#todos' do
  it 'returns todos with the correct user owner_email' do
    user = User.new('person@example.com')
    owned_todo = Todo.create! do |todo|
      todo.owner_email = 'person@example.com'
    end

    unowned_todo = Todo.create! do |todo|
      todo.owner_email = 'other@example.com'
    end

    expect(user.todos).to eq [owned_todo]
  end
end
