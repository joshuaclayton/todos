require 'spec_helper'

describe Todo do
  it { should validate_presence_of(:name) }

  context '.complete' do
    it 'returns only todos where completed_at is set' do
      complete_todo = create(:todo, :completed_at => Time.now)
      incomplete_todo = create(:todo, :completed_at => nil)

      Todo.complete.should == [complete_todo]
    end
  end

  context '.incomplete' do
    it 'returns only todos where completed_at is unset' do
      complete_todo = create(:todo, :completed_at => Time.now)
      incomplete_todo = create(:todo, :completed_at => nil)

      Todo.incomplete.should == [incomplete_todo]
    end
  end
end
