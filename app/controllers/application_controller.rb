class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if session[:current_email]
      User.new(session[:current_email])
    else
      NullUser.new
    end
  end
  helper_method :current_user

  private

  def sign_in_as(email)
    session[:current_email] = email
  end
end
