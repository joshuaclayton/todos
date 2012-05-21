class TodosController < ApplicationController
  before_filter :authenticate

  def index
    @todos = current_user.todos
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
