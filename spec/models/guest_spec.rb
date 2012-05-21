require 'spec_helper'

describe Guest do
  context '#email' do
    it 'has a nil email' do
      guest = Guest.new
      guest.email.should be_nil
    end
  end

  context '#todos' do
    it 'has no todos' do
      guest = Guest.new
      guest.todos.should be_empty
    end
  end

  context '#signed_in?' do
    it 'is false' do
      guest = Guest.new
      guest.should_not be_signed_in
    end
  end
end
