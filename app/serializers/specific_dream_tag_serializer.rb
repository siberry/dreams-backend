class SpecificDreamTagSerializer < ActiveModel::Serializer
  attributes :id
  has_one :dream
  has_one :dream_tag
end
