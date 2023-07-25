class Gym < ApplicationRecord
  has_many :facilities, dependent: :destroy
  belongs_to :gym_manager

  has_one_attached :image

  geocoded_by :address
  after_validation :geocode
  
  validates :name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :caption, presence: true
  validates :phone_number, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.png")
      image.attach(io: File.open(file_path), filename: "no_image.png", content_type: "image/png")
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def self.ransackable_attributes(auth_object = nil)
    ["address", "caption", "created_at", "gym_manager_id", "id", "is_open", "latitude", "longitude", "name", "phone_number", "postal_code", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["facilities", "gym_manager", "image_attachment", "image_blob"]
  end
end
