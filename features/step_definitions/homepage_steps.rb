When /^I go to the homepage$/ do
  visit root_path
end

Then /^I should be able to gather information about the site$/ do
  page.should have_css 'title', text: 'Todos'
  page.should have_css 'p[data-role="site-description"]'
end
