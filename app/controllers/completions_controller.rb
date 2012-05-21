class CompletionsController < ApplicationController
  def create
    todo = Todo.find(params[:todo_id])
    todo.touch :completed_at
    redirect_to todos_path
  end
end
