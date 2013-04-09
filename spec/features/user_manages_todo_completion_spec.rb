require 'spec_helper'

feature 'User manages todo completion' do
  scenario 'mark a todo complete' do
    sign_in_as 'person@example.com'
    todo = TodoOnPage.create('Buy cheese')
    todo.complete
    expect(todo).to be_completed
  end

  scenario 'mark a complete todo incomplete' do
    sign_in_as 'person@example.com'
    todo = TodoOnPage.create('Buy cheese')
    todo.complete
    todo.incomplete
    expect(todo).not_to be_completed
  end
end
