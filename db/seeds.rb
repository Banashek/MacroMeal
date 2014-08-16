# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
recipe_types = %w(Breakfast BBQ Dessert Salad)
recipe_types.each { |t| RecipeType.where(:name => t).first_or_create }

recipe_preferences = %w(Vegetarian Vegan Gluten\ Free Dairy\ Free)
recipe_preferences.each { |p| RecipePreference.where(:name => p).first_or_create }

cuisines = %w(Asian Hispanic Mediterranean TexMex)
cuisines.each { |c| Cuisine.where(:name => c).first_or_create }
