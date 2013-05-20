require 'spec_helper'

feature 'User toggles todo completion' do
  scenario 'marks as complete' do
    todo = create :todo, title: 'To be completed', owner_email: 'person@example.com'
    sign_in_as 'person@example.com'

    expect(page).not_to have_css "[data-id='#{todo.id}'] a", text: 'Incomplete'
    find("[data-id='#{todo.id}']").click_on 'Complete'

    expect(page).to have_css "[data-id='#{todo.id}'][data-state='complete']"
    expect(page).not_to have_css "[data-id='#{todo.id}'] a", text: 'Complete'
  end

  scenario 'marks as incomplete' do
    todo = create :todo, title: 'To be completed', owner_email: 'person@example.com'
    sign_in_as 'person@example.com'
    find("[data-id='#{todo.id}']").click_on 'Complete'
    find("[data-id='#{todo.id}']").click_on 'Incomplete'

    expect(page).to have_css "[data-id='#{todo.id}'][data-state='incomplete']"
  end
end
