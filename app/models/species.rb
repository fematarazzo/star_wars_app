class Species < ApplicationRecord
  has_many :species_people
  has_many :people, through: :species_people
end
