require 'spec_helper'

feature 'Manage todos' do
  scenario 'create a new todo' do
    sign_in_as 'person@example.com'
    todo_titled('Buy eggs').create

    expect(todo_titled('Buy eggs')).to be_visible
  end

  scenario 'view only todos the user has created' do
    sign_in_as 'other@example.com'
    todo_titled('Lay eggs').create

    sign_in_as 'me@example.com'

    expect(todo_titled('Lay eggs')).not_to be_visible
  end

  scenario 'complete my todos' do
    sign_in_as 'person@example.com'
    todo_titled('Buy eggs').create
    todo_titled('Buy eggs').mark_complete
    expect(todo_titled('Buy eggs')).to be_complete
  end

  scenario 'mark completed todo as incomplete' do
    sign_in_as 'person@example.com'
    todo_titled('Buy eggs').create
    todo_titled('Buy eggs').mark_complete
    todo_titled('Buy eggs').mark_incomplete
    expect(todo_titled('Buy eggs')).not_to be_complete
  end

  def todo_titled(title)
    todo = Todo.where(title: title).first_or_initialize
    TodoOnPage.new(todo)
  end

  class TodoOnPage < Struct.new(:todo)
    include Capybara::DSL

    def create
      click_link 'Create a new todo'
      fill_in 'Title', with: todo.title
      click_button 'Create'
    end

    def mark_complete
      within_todo do
        click_link 'Complete'
      end
    end

    def mark_incomplete
      within_todo do
        click_link 'Incomplete'
      end
    end

    def visible?
      within_todo_list do
        page.has_css? 'li', text: todo.title
      end
    end

    def complete?
      within_todo_list do
        page.has_css? 'li.complete', text: todo.title
      end
    end

    private

    def within_todo
      within "[data-id='#{todo.id}']" do
        yield
      end
    end

    def within_todo_list
      within 'ol.todos' do
        yield
      end
    end
  end
end
