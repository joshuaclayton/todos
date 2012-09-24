When /^I go to the homepage$/ do
  visit root_path
end

Then /^I should be able to learn about the site$/ do
  expect(page).to have_css 'title', text: 'Todos'
  expect(page).to have_css 'p[data-role="welcome"]'
end
