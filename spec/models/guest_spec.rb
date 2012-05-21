require 'spec_helper'

describe Guest do
  context '#email' do
    it 'has a nil email' do
      guest = Guest.new
      guest.email.should be_nil
    end
  end
end
