class Todo < ActiveRecord::Base
  attr_accessible :title

  validates :owner, presence: true
  validates :title, presence: true
end
