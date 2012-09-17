class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    OpenStruct.new(email: cookies[:current_email])
  end
  helper_method :current_user

  def current_email=(current_email)
    cookies[:current_email] = current_email
  end
end
