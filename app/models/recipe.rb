class Recipe < ActiveRecord::Base
  DIFFICULTY=%w(Easy Medium Hard)
  belongs_to :recipe_type
  belongs_to :recipe_preference
  belongs_to :cuisine
end
