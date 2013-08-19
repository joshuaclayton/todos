class Todo < ActiveRecord::Base
  validates :owner_email, presence: true

  def completed?
    completed_at?
  end
end
