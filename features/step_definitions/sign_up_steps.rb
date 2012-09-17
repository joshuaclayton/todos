When /^I sign up as "(.*?)"$/ do |email|
  click_link 'Log In'
  fill_in 'Email', with: email
  click_button 'Sign Up'
end

Then /^I should be signed in as "(.*?)"$/ do |email|
  page.should have_css 'p.current-user', text: email
end
