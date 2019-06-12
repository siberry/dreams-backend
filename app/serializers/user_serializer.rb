class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest
  has_many :dreams
  has_many :favorites
end
