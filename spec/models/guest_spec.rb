require 'spec_helper'

describe Guest do
  context '#signed_in?' do
    it 'returns false' do
      Guest.new.signed_in?.should == false
    end
  end

  context '#email' do
    it 'returns an empty string' do
      Guest.new.email.should == ''
    end
  end
end
