class Todo < ActiveRecord::Base
  attr_accessible :title
  validates :owner_email, presence: true
end
