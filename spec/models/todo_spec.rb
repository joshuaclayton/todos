require 'spec_helper'

describe Todo do
  it { should validate_presence_of(:owner_email) }
end

describe Todo, '#completed?' do
  it 'returns true if completed_at is assigned' do
    todo = Todo.new completed_at: Time.now

    expect(todo).to be_completed
  end

  it 'returns false if completed_at is not assigned' do
    todo = Todo.new completed_at: nil

    expect(todo).not_to be_completed
  end
end
