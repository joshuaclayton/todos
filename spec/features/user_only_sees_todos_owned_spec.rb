require 'spec_helper'

feature 'User only sees todos owned' do
  scenario "does not see other users' todos" do
    Todo.create! owner_email: 'not_me@example.com', name: 'Buy bread'

    sign_in_as 'me@example.com'

    todo_on_page = TodoOnPage.new('Buy bread')

    expect(todo_on_page).not_to be_visible
  end
end
