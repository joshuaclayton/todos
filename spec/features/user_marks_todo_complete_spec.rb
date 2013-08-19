require 'spec_helper'

feature 'User marks todo complete' do
  scenario 'updates todo as completed' do
    create_todo_named 'Buy milk'

    mark_todo_complete 'Buy milk'

    expect(page).to have_completed_todo('Buy milk')
  end

  def mark_todo_complete(name)
    find('.todos li', text: name).click_on 'Mark complete'
  end

  def have_completed_todo(name)
    have_css('.todos li.completed', text: name)
  end
end
