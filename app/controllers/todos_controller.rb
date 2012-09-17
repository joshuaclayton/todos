class TodosController < ApplicationController
  def index
    @todos = current_user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    Todo.create(params[:todo].merge(user: current_user))
    redirect_to todos_path
  end
end
