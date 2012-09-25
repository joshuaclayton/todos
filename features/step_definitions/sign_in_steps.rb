Given /^I have signed in$/ do
  visit root_path
  fill_in 'Email', with: 'person@example.com'
  click_button 'Sign In'
end

When /^I sign in as "(.*?)"$/ do |email|
  visit root_path
  fill_in 'Email', with: email
  click_button 'Sign In'
end

Then /^I should see that I am signed in as "(.*?)"$/ do |email|
  expect(page).to have_css 'p[data-role="current-user-email"]', text: email
end
