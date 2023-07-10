class Facility < ApplicationRecord
  belongs_to :gym
  belongs_to :gym_manager
end
