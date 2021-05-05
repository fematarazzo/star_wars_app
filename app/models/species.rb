class Species < ApplicationRecord
  has_many :species_people
  has_many :people, through: :species_people

  has_many :species_planets
  belongs_to :planet, through: :species_planets
end
