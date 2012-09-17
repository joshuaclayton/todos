class SessionsController < ApplicationController
  def new
  end

  def create
    self.current_email = params[:user][:email]
    redirect_to root_path
  end
end
