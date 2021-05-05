class Person < ApplicationRecord
  has_many :starship_possessions, dependent: :destroy
  has_many :starships, through: :starship_possessions

  has_many :species_people, dependent: :destroy
  has_many :species, through: :species_people

  has_many :planet_people, dependent: :destroy
  has_many :planets, through: :planet_people

  validates :name, :birth_year, :eye_color, :gender, :hair_color, :height, :mass, :skin_color, :url, presence: true
end
