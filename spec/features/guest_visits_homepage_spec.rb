require 'spec_helper'

feature 'Guest visits homepage' do
  scenario 'learn what the application can do' do
    visit '/'
    expect(page).to have_css '[data-role="app-description"]'
  end
end
