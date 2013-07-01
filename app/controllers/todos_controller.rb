class TodosController < ApplicationController
  def index
    @todo = Todo.new
    @todos = Todo.all
  end

  def create
    Todo.create(params.require(:todo).permit(:title))
    redirect_to todos_path
  end
end
