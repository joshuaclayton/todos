require 'spec_helper'

describe TodoDecorator do
  include Rails.application.routes.url_helpers

  it 'returns a link to the completion path if incomplete' do
    todo = build_stubbed(:todo)
    result = TodoDecorator.new(todo).completion_link
    Capybara::Node::Simple.new(result).should have_css("a[data-method='post'][href='#{todo_completion_path(todo)}']", text: 'Complete')
  end

  it 'returns a link to the completion path if complete' do
    todo = build_stubbed(:todo, :completed)
    result = TodoDecorator.new(todo).completion_link
    Capybara::Node::Simple.new(result).should have_css("a[data-method='delete'][href='#{todo_completion_path(todo)}']", text: 'Incomplete')
  end

  it 'renders list item for complete todo' do
    todo = build_stubbed(:todo, :completed)
    result = TodoDecorator.new(todo).list_item do
      'string'
    end

    Capybara::Node::Simple.new(result).should have_css("li.complete#todo_#{todo.id}:contains('string')")
  end

  it 'renders list item for incomplete todo' do
    todo = build_stubbed(:todo)
    result = TodoDecorator.new(todo).list_item do
      'string'
    end

    Capybara::Node::Simple.new(result).should have_css("li#todo_#{todo.id}:contains('string'):not(.complete)")
  end
end
