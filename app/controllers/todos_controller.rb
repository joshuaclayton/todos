class TodosController < ApplicationController
  before_filter :sign_in

  def index
  end

  def sign_in
    if !current_email
      redirect_to new_session_path
    end
  end
end
