class SessionsController < ApplicationController
  def create
    cookies[:current_email] = params[:session][:email]
    redirect_to root_path
  end
end
