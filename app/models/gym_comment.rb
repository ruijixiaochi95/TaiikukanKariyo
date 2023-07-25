class GymComment < ApplicationRecord
  belongs_to :user
  belongs_to :gym
end
