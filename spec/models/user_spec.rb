require 'spec_helper'

describe User do
  it 'returns email based on the argument passed' do
    user = User.new('person@example.com')
    expect(user.email).to eq 'person@example.com'
  end
end
