class RemoveAssociationColumnsModels < ActiveRecord::Migration[6.1]
  def change
    remove_column :people, :homeworld
    remove_column :people, :species
    remove_column :people, :starships
    remove_column :starships, :pilots
    remove_column :species, :homeworld
    remove_column :species, :people
    remove_column :planets, :residents
  end
end
