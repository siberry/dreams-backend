class SpecificDreamTagSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :dream_tag
end
