class SessionsController < ApplicationController
  def create
    session[:current_email] = params[:session][:email_address]
    redirect_to todos_path
  end
end
