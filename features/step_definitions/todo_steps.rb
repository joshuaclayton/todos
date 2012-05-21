When /^I create a todo$/ do
  create_todo_named 'Remember the milk'
end

When /^I create an invalid todo$/ do
  create_todo_named ''
end

Then /^I should have (\d+) todos?$/ do |todo_count|
  within 'ul.todos' do
    page.should have_css('li', count: todo_count.to_i)
  end
end

Then /^I should have no todos$/ do
  visit todos_path
  within 'ul.todos' do
    page.should have_no_css('li')
  end
end
