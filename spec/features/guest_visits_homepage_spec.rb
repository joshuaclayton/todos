require 'spec_helper'

feature 'Guest visits homepage' do
  scenario 'learn about the application' do
    visit root_path

    expect(page).to have_css '[data-role="description"]', text: /welcome/i
    expect(page).to have_css 'header', text: 'Todos'
    expect(page).to have_title 'Todos'
  end
end
