require 'spec_helper'

feature 'Manage todos' do
  scenario 'create a new todo' do
    sign_in_as 'person@example.com'
    todo = todo_on_page
    todo.create

    expect(todo).to be_visible
  end

  scenario 'view only todos the user has created' do
    sign_in_as 'other@example.com'
    todo = todo_on_page
    todo.create

    sign_in_as 'me@example.com'

    expect(todo).not_to be_visible
  end

  scenario 'complete my todos' do
    sign_in_as 'person@example.com'
    todo = todo_on_page
    todo.create
    todo.mark_complete

    expect(todo).to be_complete
  end

  scenario 'mark completed todo as incomplete' do
    sign_in_as 'person@example.com'
    todo = todo_on_page
    todo.create
    todo.mark_complete
    todo.mark_incomplete

    expect(todo).not_to be_complete
  end

  def todo_on_page
    TodoOnPage.new('Buy eggs')
  end

  class TodoOnPage < Struct.new(:title)
    include Capybara::DSL

    def create
      click_link 'Create a new todo'
      fill_in 'Title', with: title
      click_button 'Create'
    end

    def mark_complete
      todo_element.click_link 'Complete'
    end

    def mark_incomplete
      todo_element.click_link 'Incomplete'
    end

    def visible?
      todo_list.has_css? 'li', text: title
    end

    def complete?
      todo_list.has_css? 'li.complete', text: title
    end

    private

    def todo_element
      find 'li', text: title
    end

    def todo_list
      find 'ol.todos'
    end
  end
end
