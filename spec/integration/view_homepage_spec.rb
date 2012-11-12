require 'spec_helper'

feature 'Viewing the homepage' do
  scenario 'learn about the application' do
    visit root_path
    expect(page).to have_css 'title', text: 'Todos'
    expect(page).to have_css '[data-role="description"]'
  end

  scenario 'sign in to the application' do
    visit root_path
    fill_in 'Email', with: 'person@example.com'
    click_button 'Sign in'
    expect(page).to have_css '.welcome', text: 'Welcome, person@example.com'
  end
end
