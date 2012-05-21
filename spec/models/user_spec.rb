require 'spec_helper'

describe User do
  context '#email' do
    it 'has the email it was instantiated with' do
      user_with_email = User.new('person@example.com')
      user_with_email.email.should == 'person@example.com'
    end
  end
end
