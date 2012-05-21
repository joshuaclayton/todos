class SessionsController < ApplicationController
  def create
    sign_in_user params[:session][:email]
    redirect_to todos_path
  end
end
