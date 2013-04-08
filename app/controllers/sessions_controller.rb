class SessionsController < ApplicationController
  def new
  end

  def create
    sign_in_as params[:session][:email_address]
    redirect_to todos_path
  end
end
