module ApplicationHelper
  def todo_state(todo)
    if todo.completed_at
      'complete'
    else
      ''
    end
  end
end
