class Todo < ActiveRecord::Base
  def complete?
    completed_at?
  end
end
