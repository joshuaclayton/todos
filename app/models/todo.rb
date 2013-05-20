class Todo < ActiveRecord::Base
  attr_accessible :title
  validates :owner_email, presence: true

  def state
    if completed_at?
      'complete'
    else
      'incomplete'
    end
  end
end
