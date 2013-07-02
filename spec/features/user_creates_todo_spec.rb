require 'spec_helper'

feature 'User creates todo' do
  scenario 'successfully with a title' do
    sign_in

    todo_on_page = TodoOnPage.new('Buy milk')
    todo_on_page.create

    expect(todo_on_page).to be_visible
  end
end
