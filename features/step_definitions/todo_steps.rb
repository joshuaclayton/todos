Given /^I have signed in$/ do
  visit root_path
  fill_in 'Email', with: 'person@example.com'
  click_button 'Sign In'
end

When /^I create a todo titled "(.*?)"$/ do |title|
  find('a[rel="create-todo"]').click
  fill_in 'Title', with: title
  click_button 'Create Todo'
end

Then /^I should see the todo "(.*?)"$/ do |title|
  within 'ul.todos' do
    expect(page).to have_css 'li', text: title
  end
end

Given /^"(.*?)" has (\d+) todos$/ do |email, todo_count|
  todo_count = todo_count.to_i
  FactoryGirl.create_list :todo, todo_count, owner_email: email
end

When /^I view my todos$/ do
  visit todos_path
end

Then /^I should see (\d+) todos$/ do |todo_count|
  todo_count = todo_count.to_i
  within 'ul.todos' do
    expect(all('li').count).to eq todo_count
  end
end
