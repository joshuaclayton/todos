require 'spec_helper'

feature 'User creates todo' do
  scenario 'creates a new todo' do
    create_todo_named 'Buy milk'

    expect(page).to display_todo_named('Buy milk')
  end

  def create_todo_named(name)
    sign_in
    click_on 'Add new todo'
    fill_in 'Name', with: name
    click_on 'Submit'
  end
end
