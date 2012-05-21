class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if session[:email]
      User.new(session[:email])
    else
      Guest.new
    end
  end
  helper_method :current_user

  def sign_in_user(email_address)
    session[:email] = email_address
  end
end
