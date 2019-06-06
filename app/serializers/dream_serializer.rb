class DreamSerializer < ActiveModel::Serializer
  attributes :id, :date, :hours_slept, :quality, :state_of_mind, :inspiration, :image_url
  has_one :user
end
