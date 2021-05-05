class CreateSpeciesPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :species_people do |t|
      t.references :person, null: false, foreign_key: true
      t.references :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
