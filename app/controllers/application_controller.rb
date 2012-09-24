class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    User.new(cookies[:current_email])
  end
  helper_method :current_user

  def sign_in_as(email)
    cookies[:current_email] = email
  end

end
