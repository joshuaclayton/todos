Given /^"(.*?)" has the following todos:$/ do |email, table|
  table.hashes.each do |row|
    Todo.create(row.merge(user: User.new(email)))
  end
end

When /^I create a todo titled "(.*?)"$/ do |title|
  click_link 'Create a Todo'
  fill_in 'Title', with: title
  click_button 'Create'
end

Then /^I should see the following todos:$/ do |table|
  table.hashes.each do |row|
    page.should have_css 'li', text: row[:title]
  end
end

Then /^I should not see the following todos:$/ do |table|
  table.hashes.each do |row|
    page.should have_no_css 'li', text: row[:title]
  end
end
