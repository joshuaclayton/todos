class CompletionsController < ApplicationController
  def create
    current_todo.mark_complete
    redirect_to todos_path
  end

  def destroy
    current_todo.mark_incomplete
    redirect_to todos_path
  end

  private

  def current_todo
    current_user.todos.find(params[:todo_id])
  end
end
