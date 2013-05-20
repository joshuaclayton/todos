require 'spec_helper'

describe User, '#todos' do
  it 'returns todos with the correct user owner_email' do
    user = User.new('person@example.com')
    owned_todo = create :todo, owner_email: 'person@example.com'
    unowned_todo = create :todo, owner_email: 'other@example.com'

    expect(user.todos).to eq [owned_todo]
  end
end
