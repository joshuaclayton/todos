Given /^I have signed in as "(.*?)"$/ do |email|
  steps %{
    When I go to the homepage
    And I sign up as "#{email}"
  }
end

When /^I sign up as "(.*?)"$/ do |email|
  click_link 'Log In'
  fill_in 'Email', with: email
  click_button 'Sign Up'
end

When /^I sign out$/ do
  click_link 'Log Out'
end

Then /^I should be signed in as "(.*?)"$/ do |email|
  page.should have_css 'p.current-user', text: email
end

Then /^I should be signed out$/ do
  page.should have_no_css 'p.current-user'
  page.should have_no_css 'a', text: 'Log Out'
end
