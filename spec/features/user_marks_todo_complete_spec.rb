require 'spec_helper'

feature 'User marks todo complete' do
  scenario 'updates todo as completed' do
    sign_in

    todo_on_page = TodoOnPage.new('Buy milk')
    todo_on_page.create
    todo_on_page.mark_complete

    expect(todo_on_page).to be_completed
  end
end
