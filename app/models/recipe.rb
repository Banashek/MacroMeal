class Recipe < ActiveRecord::Base
  DIFFICULTY=%w(Easy Medium Hard)
  TYPE=%w(Breakfast BBQ Protien\ Powder)
  PREFERENCE=%w(Gluten\ Free Dairy\ Free Low\ Fat High\ Protein)
  CUISINE=%w(Asian Mediterranean Italian)
end
