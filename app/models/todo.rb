class Todo < ActiveRecord::Base
  attr_accessible :name, :user, :completed_at

  validates :name, presence: true

  def user=(user)
    self.owner_email = user.email
  end

  def self.complete
    where('completed_at IS NOT NULL')
  end

  def self.incomplete
    where('completed_at IS NULL')
  end
end
