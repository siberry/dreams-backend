class FollowSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :followed_id
end
