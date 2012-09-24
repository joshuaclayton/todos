require 'spec_helper'

describe User do
  it 'returns email based on the argument passed' do
    user = User.new('person@example.com')
    expect(user.email).to eq 'person@example.com'
  end
end

describe User, '#todos' do
  it 'returns todos owned by the user' do
    user = User.new('me@example.com')
    todos = FactoryGirl.create_list :todo, 2, owner_email: user.email
    expect(user.todos).to eq todos
  end
end
