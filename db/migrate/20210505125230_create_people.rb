class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :birth_year
      t.string :eye_color
      t.string :gender
      t.string :hair_color
      t.string :height
      t.string :mass
      t.string :skin_color
      t.string :homeworld
      t.text :species, array: true, default: []
      t.text :starships, array: true, default: []
      t.string :url

      t.timestamps
    end
  end
end
