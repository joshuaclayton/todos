require 'spec_helper'

feature 'User views todos' do
  scenario 'only sees todos they created' do
    Todo.new(title: 'Other todo') do |todo|
      todo.owner_email = 'other@example.com'
    end.save!

    sign_in_as 'person@example.com'

    expect(page).not_to have_css 'li', text: 'Other todo'
  end
end
