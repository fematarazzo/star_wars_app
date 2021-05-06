class CreatePlanetPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :planet_people do |t|
      t.references :planet, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
