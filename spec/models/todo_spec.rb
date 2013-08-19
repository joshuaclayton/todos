require 'spec_helper'

describe Todo do
  it { should validate_presence_of(:owner_email) }
end
