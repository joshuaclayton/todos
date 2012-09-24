class Todo < ActiveRecord::Base
  attr_accessible :title

  def user=(user)
    self.owner_email = user.email
  end

  def completed?
    completed_at?
  end
end
