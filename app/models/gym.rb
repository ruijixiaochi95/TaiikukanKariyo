class Gym < ApplicationRecord
  has_many :facilities, dependent: :destroy
  belongs_to :gym_manager
  
  has_one_attached :image
  
  geocoded_by :address
  after_validation :geocode
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.png")
      image.attach(io: File.open(file_path), filename: "no_image.png", content_type: "image/png")
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
