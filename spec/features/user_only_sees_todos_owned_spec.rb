require 'spec_helper'

feature 'User only sees todos owned' do
  scenario "does not see other users' todos" do
    Todo.create! owner_email: 'not_me@example.com', name: 'Buy bread'

    sign_in_as 'me@example.com'

    expect(page).not_to display_todo_named('Buy bread')
  end
end
