module Todos
  include Capybara::DSL

  def incomplete_todos
    todo_titles_for('ul.todos li:not(.completed)')
  end

  def complete_todos
    todo_titles_for('ul.todos li.completed')
  end

  private

  def todo_titles_for(selector)
    todo_ids = all(selector).map {|node| node['data-id'] }
    Todo.where(id: todo_ids).only(&:title).map(&:title)
  end
end

World(Todos)
