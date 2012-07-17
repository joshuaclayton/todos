module TodosHelper
  def completion_link(todo)
    if todo.completed_at?
      link_to 'Incomplete', todo_completion_path(todo), method: :delete
    else
      link_to 'Complete', todo_completion_path(todo), method: :post
    end
  end
end
