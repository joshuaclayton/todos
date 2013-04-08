require 'spec_helper'

feature 'User views todos' do
  scenario "does not see other users' todos" do
    create :todo, title: 'Buy some eggs', owner: 'other-person@example.com'
    sign_in_as 'person@example.com'
    expect(page).not_to have_todo 'Buy some eggs'
  end
end
