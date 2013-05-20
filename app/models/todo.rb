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

  def mark_complete
    touch :completed_at
  end

  def mark_incomplete
    update_attribute :completed_at, nil
  end
end
