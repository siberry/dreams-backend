class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :follows
  # has_many :dreams
  has_many :favorites
end
