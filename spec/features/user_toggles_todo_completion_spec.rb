require 'spec_helper'

feature 'User toggles todo completion' do
  scenario 'marks as complete' do
    sign_in_as 'person@example.com'

    todo_on_page = TodoOnPage.new('To be completed')
    todo_on_page.create
    expect(todo_on_page).not_to have_incomplete_link
    todo_on_page.mark_complete
    expect(todo_on_page).to be_complete
    expect(todo_on_page).not_to have_complete_link
  end

  scenario 'marks as incomplete' do
    sign_in_as 'person@example.com'

    todo_on_page = TodoOnPage.new('To be completed')
    todo_on_page.create
    todo_on_page.mark_complete
    todo_on_page.mark_incomplete
    expect(todo_on_page).to be_incomplete
  end
end
