class DreamSerializer < ActiveModel::Serializer
  attributes :id, :date, :dream, :hours_slept, :quality, :state_of_mind, :image_url, :private
  has_one :user
  
  has_many :dream_tags, through: :specific_dream_tags
end
