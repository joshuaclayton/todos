require 'spec_helper'

describe Todo, 'validations' do
  it { should validate_presence_of(:owner) }
end
