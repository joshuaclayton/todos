require 'spec_helper'

feature 'Guest creates todo' do
  scenario 'creates a new todo' do
    visit root_path
    click_on 'Add new todo'
    fill_in 'Name', with: 'Buy milk'
    click_on 'Submit'

    expect(page).to have_css('.todos li', text: 'Buy milk')
  end
end
