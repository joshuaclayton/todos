class TodosController < ApplicationController
  def index
    @todo = Todo.new
    @todos = Todo.where(owner_email: current_email)
  end

  def create
    todo = Todo.new(todo_params)
    todo.owner_email = current_email
    todo.save
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
