class PlanetPerson < ApplicationRecord
  belongs_to :planet
  belongs_to :people
end
