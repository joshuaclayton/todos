class TodosController < ApplicationController
  def index
    @todos = Todo.where(owner_email: session[:current_email])
  end

  def new
    @todo = Todo.new
  end

  def create
    Todo.new(params[:todo]) do |todo|
      todo.owner_email = session[:current_email]
    end.save

    redirect_to todos_path
  end
end
