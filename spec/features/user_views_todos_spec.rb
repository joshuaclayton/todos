require 'spec_helper'

feature 'User views todos' do
  scenario 'only sees todos they created' do
    Todo.new(title: 'Other todo') do |todo|
      todo.owner_email = 'other@example.com'
    end.save!

    visit root_path
    fill_in 'Email address', with: 'person@example.com'
    click_on 'Sign in'

    expect(page).not_to have_css 'li', text: 'Other todo'
  end
end
