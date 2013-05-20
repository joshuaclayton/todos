require 'spec_helper'

feature 'User views todos' do
  scenario 'only sees todos they created' do
    create :todo, title: 'Other todo', owner_email: 'other@example.com'

    sign_in_as 'person@example.com'

    expect(page).not_to have_css 'li', text: 'Other todo'
  end
end
