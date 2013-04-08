require 'spec_helper'

feature 'User views todos' do
  scenario "does not see other users' todos" do
    todo = Todo.new(title: 'Buy some eggs')
    todo.owner = 'other-person@example.com'
    todo.save!
    sign_in_as 'person@example.com'
    expect(page).not_to have_todo 'Buy some eggs'
  end
end
