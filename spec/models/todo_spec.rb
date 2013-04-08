require 'spec_helper'

describe Todo, 'validations' do
  it { should validate_presence_of(:owner) }
  it { should validate_presence_of(:title) }
end

describe Todo, '#completed?' do
  it 'returns true if completed_at is set' do
    todo = Todo.new completed_at: Time.current
    expect(todo).to be_completed
  end

  it 'returns false if completed_at is nil' do
    todo = Todo.new completed_at: nil
    expect(todo).not_to be_completed
  end
end

describe Todo, '#mark_complete' do
  it 'sets completed_at to Time.now' do
    Timecop.freeze do
      todo = create :todo
      todo.mark_complete
      todo.reload

      expect(todo.completed_at).to eq Time.now
    end
  end
end
