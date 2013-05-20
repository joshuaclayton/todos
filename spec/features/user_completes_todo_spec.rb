require 'spec_helper'

feature 'User completes todo' do
  scenario 'marks as complete' do
    todo = create :todo, title: 'To be completed', owner_email: 'person@example.com'
    sign_in_as 'person@example.com'
    find("[data-id='#{todo.id}']").click_on 'Complete'

    expect(page).to have_css "[data-id='#{todo.id}'][data-state='complete']"
  end
end
