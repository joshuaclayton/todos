require 'spec_helper'

describe TodoDecorator do
  include Rails.application.routes.url_helpers

  context 'completion_link' do
    it 'generates a link to complete the todo when incomplete' do
      todo = build_stubbed(:todo)
      result = TodoDecorator.new(todo).completion_link
      Capybara.string(result).should have_css("a[data-method='post'][href='#{todo_completion_path(todo)}']", text: 'Complete')
    end

    it 'generates a link to mark the todo as incomplete when complete' do
      todo = build_stubbed(:todo, :completed)
      result = TodoDecorator.new(todo).completion_link
      Capybara.string(result).should have_css("a[data-method='delete'][href='#{todo_completion_path(todo)}']", text: 'Incomplete')
    end
  end

  context 'list_item' do
    it 'renders list item for complete todo' do
      todo = build_stubbed(:todo, :completed)
      result = TodoDecorator.new(todo).list_item do
        'string'
      end

      Capybara.string(result).should have_css("li#todo_#{todo.id}.complete", text: 'string')
    end

    it 'renders list item for incomplete todo' do
      todo = build_stubbed(:todo)
      result = TodoDecorator.new(todo).list_item do
        'string'
      end

      Capybara.string(result).should have_css("li#todo_#{todo.id}:not(.complete)", text: 'string')
    end
  end
end
