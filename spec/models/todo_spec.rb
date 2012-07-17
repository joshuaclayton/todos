require 'spec_helper'

describe Todo do
  it { should validate_presence_of(:description) }
  context '#user=' do
    it "assigns #owner_email to the user's email" do
      todo = Todo.new
      todo.user = User.new('john@example.com')
      todo.owner_email.should == 'john@example.com'
    end
  end
end
