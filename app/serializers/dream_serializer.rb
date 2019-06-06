class DreamSerializer < ActiveModel::Serializer
  attributes :id, :date, :dream, :hours_slept, :quality, :state_of_mind, :image_url
  has_one :user
end
