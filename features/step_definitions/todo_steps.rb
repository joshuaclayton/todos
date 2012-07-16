When /^I create the todo "(.*?)"$/ do |todo_description|
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
