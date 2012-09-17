require 'spec_helper'

describe Guest, 'signed_in?' do
  it 'returns false' do
    expect(Guest.new).to_not be_signed_in
  end
end

describe Guest, 'email' do
  it 'returns nil' do
    expect(Guest.new.email).to be_nil
  end
end
