class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :recipe_type_id
      t.integer :recipe_preference_id
      t.integer :cuisine_id
      t.boolean :high_protein
      t.boolean :low_fat
      t.integer :protein
      t.integer :carbohydrates
      t.integer :fat
      t.string :difficulty
      t.text :ingredients
      t.text :directions

      t.timestamps
    end
  end
end
