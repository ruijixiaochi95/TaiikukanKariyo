class Facility < ApplicationRecord
  belongs_to :gym
  has_many :reservations, dependent: :destroy
end
