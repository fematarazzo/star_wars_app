class Starship < ApplicationRecord
  has_many :starship_possessions
  has_many :people, through: :starship_possessions
end
