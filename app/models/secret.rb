class Secret < ActiveRecord::Base
  attr_accessible :title, :author, :recipient

  belongs_to :author, :class_name => "User"
  belongs_to :recipient, :class_name => "User"

  validates :title, :author, :recipient, :presence => true
end
