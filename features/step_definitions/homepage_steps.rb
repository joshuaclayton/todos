When /^I go to the homepage$/ do
  visit root_path
end

Then /^I should see information about the application$/ do
  page.should have_css('title', text: 'Todos')
  page.should have_css('h1', text: 'Todos')
  page.should have_css('[data-role="description"]')
end
