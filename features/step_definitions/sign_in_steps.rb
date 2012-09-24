When /^I sign in as "(.*?)"$/ do |email|
  visit root_path
  fill_in 'Email', with: email
  click_button 'Sign In'
end

Then /^I should see that I am signed in as "(.*?)"$/ do |email|
  expect(page).to have_css 'p[data-role="current-user-email"]', text: email
end
