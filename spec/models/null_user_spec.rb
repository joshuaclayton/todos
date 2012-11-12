require 'spec_helper'

describe NullUser, '#signed_in?' do
  it 'returns false' do
    expect(NullUser.new).to_not be_signed_in
  end
end
