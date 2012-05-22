module TodoList
  def ensure_incomplete_todos_named(todos)
    ensure_todos_named 'ul.incomplete-todos', todos
  end

  def ensure_complete_todos_named(todos)
    ensure_todos_named 'ul.complete-todos', todos
  end

  private

  def ensure_todos_named(class_name, todos)
    within class_name do
      todos.each_with_index do |row, index|
        page.should have_css("li:nth-child(#{index + 1})", text: row[:name])

        if row[:completed_at]
          page.should have_css("li:nth-child(#{index + 1}) .meta", text: row[:completed_at])
        end
      end
      page.should have_css('li', count: todos.length)
    end
  end
end

World TodoList
