require 'spec_helper'

feature 'Viewing the homepage' do
  scenario 'learn about the application' do
    visit root_path
    expect(page).to have_css 'title', text: 'Todos'
    expect(page).to have_css '[data-role="description"]'
  end
end
