class CompletionsController < ApplicationController
  def create
    current_user.todos.find(params[:todo_id]).touch :completed_at
    redirect_to todos_path
  end
end
