class Follow < ApplicationRecord
  belongs_to :user # "user" is follower
end
