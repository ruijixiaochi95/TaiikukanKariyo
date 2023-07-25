class Facility < ApplicationRecord
  belongs_to :gym
  has_many :reservations, dependent: :destroy
  
  validates :name, presence: true
end
