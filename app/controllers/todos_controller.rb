class TodosController < ApplicationController
  def index
    @todos = current_user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    current_user.todos.create params[:todo].permit(:name)
    redirect_to todos_path
  end
end
