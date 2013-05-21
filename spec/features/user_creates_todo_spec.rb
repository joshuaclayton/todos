require 'spec_helper'

feature 'User creates todo' do
  scenario 'with a title' do
    sign_in_as 'person@example.com'

    todo_on_page = TodoOnPage.new('Test our app')
    todo_on_page.create
    expect(todo_on_page).to be_present
  end
end
