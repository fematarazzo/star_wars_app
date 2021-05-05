class Planet < ApplicationRecord
  has_many :planet_people
  has_many :people, through: :planet_people

  has_many :species_planets
  has_many :species, through: :species_planets
end
