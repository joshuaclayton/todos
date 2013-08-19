class ApplicationController < ActionController::Base
  protect_from_forgery

  def sign_in_as(email)
    session[:current_email] = email
  end

  def current_user
    User.new(session[:current_email])
  end
  # def current_email
  #   session[:current_email]
  # end
end
