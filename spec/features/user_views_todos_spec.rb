require 'spec_helper'

feature 'User views todos' do
  scenario "does not see others' todos" do
    Todo.create(title: 'Buy eggs', owner_email: 'not_me@example.com')
    sign_in_with 'me@example.com'

    todo_on_page = TodoOnPage.new('Buy eggs')
    expect(todo_on_page).not_to be_visible
  end
end
