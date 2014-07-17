class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.float :cost
      t.string :diet
      t.text :ingredients
      t.text :details_dump
      t.text :scrap_dump

      t.timestamps
    end
  end
end