class Person < ApplicationRecord
  has_many :starship_possessions
  has_many :starships, through: :starship_possessions
end
