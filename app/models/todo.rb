class Todo < ActiveRecord::Base
  validates :owner_email, presence: true
end
