require 'spec_helper'

feature 'User manages todo completions' do
  scenario 'marks todo complete' do
    sign_in
    todo_object = TodoOnPage.new('Buy fruit')
    todo_object.create
    todo_object.mark_complete

    expect(todo_object).to be_complete
  end

  scenario 'marks todo incomplete' do
    sign_in
    todo_on_page = TodoOnPage.new('Buy fruit')
    todo_on_page.create
    todo_on_page.mark_complete
    todo_on_page.mark_incomplete

    expect(todo_on_page).not_to be_complete
  end
end
