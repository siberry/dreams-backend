class SpecificDreamTagSerializer < ActiveModel::Serializer
  attributes :id, :dream_id, :dream_tag_id
  # has_one :dream
  # has_one :dream_tag
end
