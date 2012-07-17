class Todo < ActiveRecord::Base
  attr_accessible :description

  validates :description, presence: true

  def user=(new_user)
    self.owner_email = new_user.email
  end
end
