class TodosController < ApplicationController
  def index
    @todos = Todo.where(owner_email: session[:current_email])
  end

  def new
    @todo = Todo.new
  end

  def create
    Todo.create params[:todo].merge(owner_email: session[:current_email]).permit(:name, :owner_email)
    redirect_to todos_path
  end
end
