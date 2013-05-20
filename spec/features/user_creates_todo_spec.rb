require 'spec_helper'

feature 'User creates todo' do
  scenario 'with a title' do
    visit root_path
    fill_in 'Email address', with: 'person@example.com'
    click_on 'Sign in'

    click_on 'Create new todo'
    fill_in 'Title', with: 'Test our app'
    click_on 'Create'

    expect(page).to have_css 'li', text: 'Test our app'
  end
end
