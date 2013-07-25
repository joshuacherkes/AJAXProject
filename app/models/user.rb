class User < ActiveRecord::Base
  attr_accessible :username, :password
  attr_reader :password

  has_many(
    :authored_secrets,
    :class_name => "Secret",
    :foreign_key => "author_id"
  )
  has_many(
    :received_secrets,
    :class_name => "Secret",
    :foreign_key => "recipient_id"
  )

  has_many :stalks, :class_name => "Friendship", :foreign_key => :friend_id
  has_many :friendships, :class_name => "Friendship", :foreign_key => :user_id

  has_many :friends, :through => :friendships, :class_name => "User",
  :foreign_key => "user_id"

  has_many :stalkers, :through => :stalks, :class_name => "User",
  :foreign_key => "friend_id", :source => :user

  validates :username, :password_digest, :presence => true

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
