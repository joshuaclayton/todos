require 'spec_helper'

feature 'User creates todo' do
  scenario 'successfully with a title' do
    sign_in_as 'person@example.com'
    create_todo_titled 'Buy some milk'
    expect(page).to have_todo 'Buy some milk'
  end

  def create_todo_titled(title)
    click_on 'Add a Todo'
    fill_in 'Title', with: title
    click_on 'Submit'
  end

end
