require 'spec_helper'

describe Todo, 'validations' do
  it { should validate_presence_of :title }
end

describe Todo, '#owner=' do
  it 'assigns user email to owner_email' do
    user = User.new('person@example.com')
    todo = Todo.new
    todo.owner = user
    expect(todo.owner_email).to eq 'person@example.com'
  end
end

describe Todo, '#completed?' do
  it 'returns false when completed_at is not set' do
    expect(Todo.new).not_to be_completed
  end

  it 'returns true when completed_at is set' do
    todo = Todo.new(completed_at: Time.now)
    expect(todo).to be_completed
  end
end

describe Todo, '#mark_complete' do
  it 'sets completed_at to Time.now' do
    Timecop.freeze Time.now do
      todo = create(:todo)
      todo.mark_complete
      todo.reload
      expect(todo.completed_at.to_i).to eq Time.now.to_i
    end
  end
end

describe Todo, '#mark_incomplete' do
  it 'sets completed_at to nil' do
    todo = create(:todo, completed_at: Time.now)
    todo.mark_incomplete
    todo.reload
    expect(todo.completed_at).to be_nil
  end
end
