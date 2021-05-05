class Species < ApplicationRecord
  has_many :species_people, dependent: :destroy
  has_many :people, through: :species_people

  has_many :species_planets, dependent: :destroy
  has_many :planets, through: :species_planets

  validates :name, :classification, :designation, :average_height, :average_lifespan, :eye_colors, :hair_colors, :skin_colors, :language, :url, presence: true
end
