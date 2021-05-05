class Starship < ApplicationRecord
  has_many :starship_possessions, dependent: :destroy
  has_many :people, through: :starship_possessions

  validates :name, :model, :starship_class, :manufacturer, :cost_in_credits, :length, :crew, :passengers, :max_atmosphering_speed, :hyperdrive_rating, :MGLT, :cargo_capacity, :consumables, :url, presence: true
end
