class SpecificDreamTag < ApplicationRecord
  belongs_to :dream
  belongs_to :dream_tag

  validates_uniqueness_of :dream_tag_id, scope: :dream_id
end
