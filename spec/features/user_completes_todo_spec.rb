require 'spec_helper'

feature 'User completes todo' do
  scenario 'successfully' do
    sign_in_as 'person@example.com'
    todo = TodoOnPage.new('Buy cheese')
    todo.create
    todo.complete
    expect(todo).to be_completed
  end
end
