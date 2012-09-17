class SessionsController < ApplicationController
  def new
  end

  def create
    cookies[:current_user] = params[:user][:email]
    redirect_to root_path
  end
end
