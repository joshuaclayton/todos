class Todo < ActiveRecord::Base
  attr_accessible :title, :user
  validates :title, presence: true

  def user=(user)
    self.owner_email = user.email
  end

  def completed?
    completed_at.present?
  end
end
