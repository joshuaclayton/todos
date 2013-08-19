class SessionsController < ApplicationController
  def new
  end

  def create
    session[:current_email] = params[:session][:email]
    redirect_to todos_path
  end
end
