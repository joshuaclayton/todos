class ApplicationController < ActionController::Base
  protect_from_forgery

  def sign_in_with(email)
    session[:current_email] = email
  end

  def current_email
    session[:current_email]
  end
  helper_method :current_email
end
