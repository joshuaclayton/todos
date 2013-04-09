require 'spec_helper'

feature 'User creates todo' do
  scenario 'successfully with a title' do
    sign_in_as 'person@example.com'
    todo = TodoOnPage.create('Buy some milk')
    expect(todo).to be_present
  end
end
