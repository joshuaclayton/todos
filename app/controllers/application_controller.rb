class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_email
    session[:current_email]
  end
  helper_method :current_email

  private

  def sign_in_as(email)
    session[:current_email] = email
  end
end
