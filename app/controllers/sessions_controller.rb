class SessionsController < ApplicationController
  def new
  end

  def create
    self.current_email = params[:user][:email]
    redirect_to todos_path
  end

  def destroy
    self.current_email = nil
    redirect_to root_path
  end
end
