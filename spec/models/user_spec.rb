require 'spec_helper'

describe User, '#todos' do
  it 'returns todos for the user' do
    user = User.new('person@example.com')
    todo = create :todo, owner: 'person@example.com'
    create :todo, owner: 'someone-else@example.com'

    expect(user.todos).to eq [todo]
  end
end
