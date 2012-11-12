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

describe User do
  context '#email' do
    it 'returns the email the user was instantiated with' do
      user = User.new('person@example.com')
      expect(user.email).to eq 'person@example.com'
    end
  end

  context '#signed_in?' do
    it 'returns true' do
      user = User.new('person@example.com')
      expect(user).to be_signed_in
    end
  end
end
