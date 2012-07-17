When /^I flag my todo "(.*?)" complete$/ do |todo_description|
  visit todos_path
  todo = Todo.find_by_description(todo_description)
  find("li##{dom_id(todo)} a:contains('Complete')").click
end

When /^I flag my todo "(.*?)" incomplete$/ do |todo_description|
  visit todos_path
  todo = Todo.find_by_description(todo_description)
  find("li##{dom_id(todo)} a:contains('Incomplete')").click
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
