class Todo < ActiveRecord::Base
  attr_accessible :title, :owner, :completed_at

  validates :title, presence: true

  def owner=(owner)
    self.owner_email = owner.email
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
