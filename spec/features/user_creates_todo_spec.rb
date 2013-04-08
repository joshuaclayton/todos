require 'spec_helper'

feature 'User creates todo' do
  scenario 'successfully with a title' do
    visit '/'
    sign_in_as 'person@example.com'
    click_on 'Add a Todo'
    fill_in 'Title', with: 'Buy some milk'
    click_on 'Submit'
    expect(page).to have_css 'li', text: 'Buy some milk'
  end

  def sign_in_as(email_address)
    click_on 'Sign in'
    fill_in 'Email address', with: email_address
    click_on 'Sign in'
  end
end
