class TodosController < ApplicationController
  before_filter :authenticate

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    Todo.create(params[:todo])
    redirect_to todos_path
  end
end
