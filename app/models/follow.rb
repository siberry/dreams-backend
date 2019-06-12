class Follow < ApplicationRecord
  belongs_to :user # "user" is follower
  belongs_to :followed, class_name: 'User', foreign_key: 'followed_id'
	belongs_to :follower, class_name: 'User', foreign_key: 'user_id'
end
