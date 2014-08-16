json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :recipe_type_id, :recipe_preference_id, :cuisine_id, :high_protein, :low_fat, :protein, :carbohydrates, :fat, :difficulty, :ingredients, :directions
  json.url recipe_url(recipe, format: :json)
end
