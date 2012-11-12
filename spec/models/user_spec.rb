require 'spec_helper'

describe User, '#email' do
  it 'returns the email the user was instantiated with' do
    user = User.new('person@example.com')
    expect(user.email).to eq 'person@example.com'
  end
end

describe User, '#signed_in?' do
  it 'returns true' do
    user = User.new('person@example.com')
    expect(user).to be_signed_in
  end
end

describe User, '#todos' do
  it 'returns todos whose owner is the user email' do
    user = User.new('john@example.com')

    todo_owned_by_me = Todo.create!(owner: user)
    todo_not_owned_by_me = Todo.create!

    expect(user.todos).to eq [todo_owned_by_me]
  end
end
