class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_email=(email_address)
    session[:email] = email_address
  end

  def current_email
    session[:email]
  end
  helper_method :current_email

  def authenticate
    if !current_email
      redirect_to new_session_path
    end
  end
end
