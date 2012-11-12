require 'spec_helper'

feature 'Manage todos' do
  scenario 'create a new todo' do
    sign_in_as 'person@example.com'
    create_todo_titled 'Buy eggs'
    user_should_see_todo_titled 'Buy eggs'
  end

  scenario 'view only todos the user has created' do
    sign_in_as 'other@example.com'
    create_todo_titled 'Lay eggs'

    sign_in_as 'me@example.com'

    user_should_not_see_todo_titled 'Lay eggs'
  end

  scenario 'complete my todos' do
    sign_in_as 'person@example.com'
    create_todo_titled 'Buy eggs'
    complete_todo_titled 'Buy eggs'
    user_should_see_completed_todo_titled 'Buy eggs'
  end

  def create_todo_titled(title)
    click_link 'Create a new todo'
    fill_in 'Title', with: title
    click_button 'Create'
  end

  def user_should_see_todo_titled(title)
    within 'ol.todos' do
      expect(page).to have_css 'li', text: title
    end
  end

  def user_should_see_completed_todo_titled(title)
    within 'ol.todos' do
      expect(page).to have_css 'li.complete', text: title
    end
  end

  def user_should_not_see_todo_titled(title)
    within 'ol.todos' do
      expect(page).not_to have_css 'li', text: title
    end
  end

  def complete_todo_titled(title)
    todo = Todo.where(title: title).first

    within "[data-id='#{todo.id}']" do
      click_link 'Complete'
    end
  end
end
