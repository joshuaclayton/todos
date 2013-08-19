require 'spec_helper'

feature 'User creates todo' do
  scenario 'creates a new todo' do
    create_todo_named 'Buy milk'

    expect(page).to display_todo_named('Buy milk')
  end
end
