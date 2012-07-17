Given /^I am signed in as "(.*?)"$/ do |email_address|
  When %{I sign in as "#{email_address}"}
  Then %{I should be signed in as "#{email_address}"}
end

Given /^I am not signed in$/ do
  visit todos_path
  page.should have_no_css('[data-current-user]')
  page.should have_no_css('a', text: 'Sign out')
end

When /^I sign in as "(.*?)"$/ do |email_address|
  if page.current_path != new_session_path
    visit new_session_path
  end

  fill_in 'Email Address', with: email_address
  click_button 'Sign In'
end

When /^I sign out$/ do
  click_link 'Sign out'
end

Then /^I should be signed in as "(.*?)"$/ do |email_address|
  visit todos_path
  page.should have_css("[data-current-user='#{email_address}']")
  page.should have_no_css('#new_session')
end

Then /^I should be prompted to sign in$/ do
  page.should have_css('#new_session')
end
