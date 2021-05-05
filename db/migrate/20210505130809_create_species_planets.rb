class CreateSpeciesPlanets < ActiveRecord::Migration[6.1]
  def change
    create_table :species_planets do |t|
      t.references :species, null: false, foreign_key: true
      t.references :planet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
