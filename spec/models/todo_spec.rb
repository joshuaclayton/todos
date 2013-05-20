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
