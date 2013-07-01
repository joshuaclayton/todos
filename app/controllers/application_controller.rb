require 'ostruct'

class ApplicationController < ActionController::Base
  protect_from_forgery

  def sign_in_with(email)
    session[:current_email] = email
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

  def current_email
    session[:current_email]
  end
end
