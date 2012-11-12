require 'spec_helper'

feature 'Viewing the homepage' do
  scenario 'learn about the application' do
    view_homepage
    user_should_see_app_information
  end

  scenario 'sign in to the application' do
    view_homepage
    user_should_not_be_signed_in
    sign_in_as 'person@example.com'
    user_should_be_signed_in_as 'person@example.com'
  end

  def user_should_see_app_information
    expect(page).to have_css 'title', text: 'Todos'
    expect(page).to have_css '[data-role="description"]'
  end

  def user_should_not_be_signed_in
    expect(page).to have_no_css '.welcome'
  end

  def user_should_be_signed_in_as(email)
    expect(page).to have_css '.welcome', text: "Welcome, #{email}"
  end

  def view_homepage
    visit root_path
  end

  def sign_in_as(email)
    fill_in 'Email', with: email
    click_button 'Sign in'
  end
end
