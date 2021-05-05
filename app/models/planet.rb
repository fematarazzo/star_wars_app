class Planet < ApplicationRecord
  has_many :planet_people, dependent: :destroy
  has_many :people, through: :planet_people

  has_many :species_planets, dependent: :destroy
  has_many :species, through: :species_planets

  validates :name, :diameter, :rotation_period, :orbital_period, :gravity, :population, :climate, :terrain, :surface_water, :residents, :url, presence: true
end
