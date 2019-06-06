class SpecificDreamTag < ApplicationRecord
  belongs_to :user
  belongs_to :dream_tag
end
