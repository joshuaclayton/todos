Given /^I have signed in$/ do
  sign_in_as 'person@example.com'
end

When /^I sign in as "(.*?)"$/ do |email|
  sign_in_as email
end

Then /^I should see that I am signed in as "(.*?)"$/ do |email|
  expect(page).to have_css 'p[data-role="current-user-email"]', text: email
end
