class Todo < ActiveRecord::Base
  attr_accessible :title

  def user=(user)
    self.owner_email = user.email
  end

  def completed?
    completed_at?
  end

  def mark_complete
    touch :completed_at
  end

  def mark_incomplete
    update_column :completed_at, nil
  end
end
