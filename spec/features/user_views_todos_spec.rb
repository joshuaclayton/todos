require 'spec_helper'

feature 'User views todos' do
  scenario "does not see other users' todos" do
    create :todo, title: 'Buy some eggs', owner: 'other-person@example.com'
    sign_in_as 'person@example.com'
    todo = TodoOnPage.new('Buy some eggs')
    expect(todo).not_to be_present
  end
end
