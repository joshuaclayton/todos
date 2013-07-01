require 'spec_helper'

describe User, '#signed_in?' do
  it 'returns true' do
    user = User.new('person@example.com')
    expect(user).to be_signed_in
  end
end

describe User, '#display_name' do
  it 'returns email address of the user' do
    user = User.new('person@example.com')
    expect(user.display_name).to eq 'person@example.com'
  end
end

describe User, '#todos' do
  it 'returns todos owned by that user' do
    todo_not_owned_by_person = Todo.create(owner_email: 'different@example.com')
    todo = Todo.create(owner_email: 'person@example.com')
    user = User.new('person@example.com')

    expect(user.todos).to eq [todo]
  end
end
