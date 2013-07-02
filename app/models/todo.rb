class Todo < ActiveRecord::Base
  def complete?
    completed_at?
  end

  def mark_complete
    touch :completed_at
  end

  def mark_incomplete
    update_column :completed_at, nil
  end
end
