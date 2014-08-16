class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.bool :high_protein
      t.bool :low_fat
      t.int :protein
      t.int :carbohydrates
      t.int :fat
      t.string :difficulty
      t.text :ingredients
      t.text :directions

      t.timestamps
    end
  end
end
