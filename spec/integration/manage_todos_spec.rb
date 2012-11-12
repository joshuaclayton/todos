require 'spec_helper'

feature 'Manage todos' do
  scenario 'create a new todo' do
    sign_in_as 'person@example.com'
    create_todo_titled 'Buy eggs'

    expect(todo_titled('Buy eggs')).to be_visible
  end

  scenario 'view only todos the user has created' do
    sign_in_as 'other@example.com'
    create_todo_titled 'Lay eggs'

    sign_in_as 'me@example.com'

    expect(todo_titled('Lay eggs')).not_to be_visible
  end

  scenario 'complete my todos' do
    sign_in_as 'person@example.com'
    create_todo_titled 'Buy eggs'
    todo_titled('Buy eggs').mark_complete
    expect(todo_titled('Buy eggs')).to be_complete
  end

  scenario 'mark completed todo as incomplete' do
    sign_in_as 'person@example.com'
    create_todo_titled 'Buy eggs'
    todo_titled('Buy eggs').mark_complete
    todo_titled('Buy eggs').mark_incomplete
    expect(todo_titled('Buy eggs')).not_to be_complete
  end

  def create_todo_titled(title)
    click_link 'Create a new todo'
    fill_in 'Title', with: title
    click_button 'Create'
  end

  def todo_titled(title)
    todo = Todo.where(title: title).first
    TodoOnPage.new(todo)
  end

  class TodoOnPage < Struct.new(:todo)
    include Capybara::DSL

    def mark_complete
      within "[data-id='#{todo.id}']" do
        click_link 'Complete'
      end
    end

    def mark_incomplete
      within "[data-id='#{todo.id}']" do
        click_link 'Incomplete'
      end
    end

    def visible?
      within 'ol.todos' do
        page.has_css? 'li', text: todo.title
      end
    end

    def complete?
      within 'ol.todos' do
        page.has_css? 'li.complete', text: todo.title
      end
    end
  end
end
