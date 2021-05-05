class SpeciesPerson < ApplicationRecord
  belongs_to :person
  belongs_to :species
end
