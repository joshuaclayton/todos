require 'spec_helper'

feature 'User completes todo' do
  scenario 'successfully' do
    create :todo, owner: 'person@example.com', title: 'Buy cheese'
    sign_in_as 'person@example.com'
    complete_todo 'Buy cheese'
    expect(page).to have_completed_todo 'Buy cheese'
  end

  def complete_todo(title)
    within "li:contains('#{title}')" do
      click_on 'Mark complete'
    end
  end
end
