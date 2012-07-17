class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_email=(email_address)
    session[:email] = email_address
  end

  def current_user
    if current_email
      User.new(current_email)
    else
      Guest.new
    end
  end
  helper_method :current_user

  private

  def authenticate
    if !current_user.signed_in?
      redirect_to new_session_path
    end
  end

  def current_email
    session[:email]
  end
end
