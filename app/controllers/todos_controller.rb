class TodosController < ApplicationController
  before_filter :authenticate

  def index
    @incomplete_todos = current_user.todos.incomplete
    @complete_todos = current_user.todos.complete
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(params[:todo].merge(user: current_user))

    if @todo.save
      redirect_to todos_path
    else
      render :new
    end
  end
end
