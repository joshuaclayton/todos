class CompletionsController < ApplicationController
  def create
    todo = current_user.todos.find(params[:todo_id])
    todo.touch :completed_at
    redirect_to todos_path
  end

  def destroy
    todo = current_user.todos.find(params[:todo_id])
    todo.update_attribute :completed_at, nil
    redirect_to todos_path
  end
end
