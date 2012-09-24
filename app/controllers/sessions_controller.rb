class SessionsController < ApplicationController
  def create
    sign_in_as params[:session][:email]
    redirect_to root_path
  end
end
