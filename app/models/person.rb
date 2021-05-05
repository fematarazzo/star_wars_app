class Person < ApplicationRecord
  has_many :starship_possessions
  has_many :starships, through: :starship_possessions

  has_many :species_people
  has_many :species, through: :species_people
end
