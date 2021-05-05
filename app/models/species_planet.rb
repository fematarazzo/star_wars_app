class SpeciesPlanet < ApplicationRecord
  belongs_to :species
  belongs_to :planet
end
