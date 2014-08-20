class Recipe < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  DIFFICULTY=%w(Easy Medium Hard)

  def name=(value)
    write_attribute(:name, value.downcase)
  end

  def self.myRecipes(user_id)
    where('user_id = ?', user_id)
  end

  private

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search.downcase}%")
    else
      all
    end
  end

  def self.advancedSearch(recipe_name = "", high_protein = false, low_fat = false, protein_low = 0, protein_high = 999, carbohydrates_low = 0, carbohydrates_high = 999, fat_low = 0, fat_high = 999, difficulty = "easy") 

    where('fat BETWEEN ? AND ? AND carbohydrates BETWEEN ? AND ? AND protein BETWEEN ? AND ? AND name LIKE ?', fat_low, fat_high, carbohydrates_low, carbohydrates_high, protein_low, protein_high, "%#{recipe_name}%")
    
  end

end
