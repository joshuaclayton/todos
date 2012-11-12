class Todo < ActiveRecord::Base
  attr_accessible :title, :owner, :completed_at

  def owner=(owner)
    self.owner_email = owner.email
  end

  def completed?
    completed_at?
  end
end
