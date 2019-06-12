class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  has_many :dreams
  has_many :follows

  has_many :followers, class_name: 'Follow', foreign_key: :followed_id
	has_many :fans, through: :followers, source: :follower

	has_many :followed, class_name: 'Follow', foreign_key: :user_id
	has_many :favorites, through: :followed, source: :followed

  # def following
  #   self.follows.map { |follow| User.find(follow.followed_id) }
  # end
  #
  # def followers
  #   Follow.all.select { |follow| follow.followed_id === self.id }.map { |follow| follow.user }
  # end
  #
  # def set_user_avatar
  #   self.update(avatar: "https://api.adorable.io/avatars/184/#{self.username}")
  # end
end
