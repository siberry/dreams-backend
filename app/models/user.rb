class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  has_many :dreams
  has_many :follows

  def following
    self.follows.map { |follow| User.find(follow.followed_id) }
  end

  def followers
    Follow.all.select { |follow| follow.followed_id === self.id }.map { |follow| follow.user }
  end

  def set_user_avatar
    self.update(avatar: "https://api.adorable.io/avatars/184/#{self.username}")
  end
end
