require 'spec_helper'

describe Todo do
  it { should validate_presence_of(:owner_email) }
end

describe Todo, '#state' do
  it 'returns complete when todo is complete' do
    todo = build :todo, completed_at: Time.now
    expect(todo.state).to eq 'complete'
  end

  it 'returns incomplete when todo is not complete' do
    todo = build :todo, completed_at: nil
    expect(todo.state).to eq 'incomplete'
  end
end

describe Todo, '#mark_complete' do
  it 'updates completed_at' do
    Timecop.freeze Time.now do
      todo = create :todo
      todo.mark_complete
      expect(todo.completed_at).to eq Time.now
    end
  end
end

describe Todo, '#mark_incomplete' do
  it 'sets completed_at to nil' do
    todo = create :todo, completed_at: Time.now
    todo.mark_incomplete
    expect(todo.completed_at).to be_nil
  end
end
