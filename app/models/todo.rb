class Todo < ActiveRecord::Base
  attr_accessible :name, :user

  validates :name, presence: true

  def user=(user)
    self.owner_email = user.email
  end
end
