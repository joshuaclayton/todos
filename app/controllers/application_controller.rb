class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    User.new session[:current_email]
  end

  def sign_in_as(email)
    session[:current_email] = email
  end
end
