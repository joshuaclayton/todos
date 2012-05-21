module TodoList
  def ensure_incomplete_todos_named(todo_names)
    ensure_todos_named 'ul.incomplete-todos', todo_names
  end

  def ensure_complete_todos_named(todo_names)
    ensure_todos_named 'ul.complete-todos', todo_names
  end

  private

  def ensure_todos_named(class_name, todo_names)
    within class_name do
      todo_names.each_with_index do |row, index|
        page.should have_css("li:nth-child(#{index + 1})", text: row[:name])
      end
      page.should have_css('li', count: todo_names.length)
    end
  end
end

World TodoList
