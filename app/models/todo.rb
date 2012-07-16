class Todo < ActiveRecord::Base
  attr_accessible :description

  def user=(new_user)
    self.owner_email = new_user.email
  end
end
