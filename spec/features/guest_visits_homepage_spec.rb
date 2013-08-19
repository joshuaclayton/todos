require 'spec_helper'

feature 'Guest visits homepage' do
  scenario 'learn about the application' do
    visit root_path

    expect(page).to have_css('h1', text: 'Welcome to Todos!')
    expect(page).to have_css('[data-role="description"]')
    expect(page).to have_title('Todos')
  end
end
