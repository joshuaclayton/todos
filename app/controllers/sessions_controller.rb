class SessionsController < ApplicationController
  def new
  end

  def create
    redirect_to todos_path
  end
end
