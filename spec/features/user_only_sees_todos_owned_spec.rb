require 'spec_helper'

feature 'User only sees todos owned' do
  scenario "does not see other users' todos" do
    Todo.create! owner_email: 'not_me@example.com', name: 'Buy bread'

    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: 'me@example.com'
    click_on 'Submit'

    expect(page).not_to have_css '.todos li', text: 'Buy bread'
  end
end
