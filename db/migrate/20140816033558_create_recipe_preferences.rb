class CreateRecipePreferences < ActiveRecord::Migration
  def change
    create_table :recipe_preferences do |t|
      t.string :name

      t.timestamps
    end
  end
end
