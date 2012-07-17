Given /^I have the following todos:$/ do |table|
  table.hashes.each do |row|
    step %{I create the todo "#{row[:description]}"}
  end
end

When /^I view my todos$/ do
  visit todos_path
end

When /^I (?:attempt to )?create the todo "(.*?)"$/ do |todo_description|
  visit todos_path
  click_link 'Create a Todo'
  fill_in 'Description', with: todo_description
  click_button 'Create'
end

Then /^I should see my todo "(.*?)"$/ do |todo_description|
  within 'ul#my-todos' do
    page.should have_css('li', text: todo_description)
  end
end

Then /^I should not see the todo "(.*?)"$/ do |todo_description|
  within 'ul#my-todos' do
    page.should have_no_css('li', text: todo_description)
  end
end

When /^I complete my todo "(.*?)"$/ do |todo_description|
  visit todos_path
  todo = Todo.find_by_description(todo_description)
  find("li##{dom_id(todo)} a").click
end

Then /^the todo "(.*?)" is complete$/ do |todo_description|
  within 'ul#my-todos' do
    page.should have_css('li.complete', text: todo_description)
  end
end

Then /^the todo "(.*?)" is incomplete$/ do |todo_description|
  within 'ul#my-todos' do
    page.should have_css('li:not(.complete)', text: todo_description)
  end
end

World ActionController::RecordIdentifier
