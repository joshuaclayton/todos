require 'spec_helper'

feature 'User creates todo' do
  scenario 'with a title' do
    sign_in_as 'person@example.com'
    create_todo_titled 'Test our app'

    expect(page).to have_css 'li', text: 'Test our app'
  end

  def create_todo_titled(title)
    click_on 'Create new todo'
    fill_in 'Title', with: title
    click_on 'Create'
  end
end
