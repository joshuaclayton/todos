class Todo < ActiveRecord::Base
  attr_accessible :title, :completed_at

  validates :owner, presence: true
  validates :title, presence: true

  def completed?
    completed_at?
  end

  def mark_complete
    touch :completed_at
  end
end
