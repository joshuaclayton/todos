require 'spec_helper'

feature 'User marks todos complete' do
  scenario 'successfully' do
    sign_in
    create_todo_titled 'Buy fruit'

    within find('li', text: 'Buy fruit') do
      click_on 'Mark complete'
    end

    within find('li', text: 'Buy fruit') do
      expect(page).not_to have_link 'Mark complete'
    end
  end

  def create_todo_titled(title)
    fill_in 'Title', with: title
    click_on 'Create Todo'
  end
end
