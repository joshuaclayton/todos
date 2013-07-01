require 'spec_helper'

feature 'Guest signs in' do
  scenario 'successfully' do
    visit root_path

    expect(page).not_to display_welcome_message

    sign_in_with 'person@example.com'

    expect(page).to display_welcome_message('person@example.com')
  end

  def display_welcome_message(email = nil)
    have_css '[data-role="welcome"]', text: email
  end
end
