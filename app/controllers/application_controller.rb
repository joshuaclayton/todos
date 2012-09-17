class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if cookies[:current_email]
      User.new(cookies[:current_email])
    else
      Guest.new
    end
  end
  helper_method :current_user

  def current_email=(current_email)
    if current_email
      cookies[:current_email] = current_email
    else
      cookies.delete :current_email
    end
  end
end
