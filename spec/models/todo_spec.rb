require 'spec_helper'

describe Todo, '#complete?' do
  it 'returns true when completed_at is set' do
    todo = Todo.new(completed_at: Time.current)
    expect(todo).to be_complete
  end

  it 'returns false when completed_at is nil' do
    todo = Todo.new(completed_at: nil)
    expect(todo).not_to be_complete
  end
end
