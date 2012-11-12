class Todo < ActiveRecord::Base
  attr_accessible :title, :owner

  def owner=(owner)
    self.owner_email = owner.email
  end
end
