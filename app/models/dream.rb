class Dream < ApplicationRecord
  belongs_to :user
  has_many :specific_dream_tags, dependent: :destroy
  has_many :dream_tags, through: :specific_dream_tags
end
