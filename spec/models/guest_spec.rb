require 'spec_helper'

describe Guest do
  context '#signed_in?' do
    it 'returns false' do
      Guest.new.signed_in?.should == false
    end
  end
end
