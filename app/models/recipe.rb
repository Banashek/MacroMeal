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

  def self.advancedSearch(recipe_name = "", protein_low = 0, protein_high = 999, carbohydrates_low = 0, carbohydrates_high = 999, fat_low = 0, fat_high = 999, high_protein = false, low_fat = false) 

    fat_low = 0 if fat_low.blank?
    fat_high = 999 if fat_high.blank?
    carbohydrates_low = 0 if carbohydrates_low.blank?
    carbohydrates_high = 999 if carbohydrates_high.blank?
    protein_low = 0 if protein_low.blank?
    protein_high = 999 if protein_high.blank?

    querystring = ""
    querystring += 'fat > ? AND '
    querystring += 'fat < ? AND '
    querystring += 'carbohydrates > ? AND '
    querystring += 'carbohydrates < ? AND '
    querystring += 'protein > ? AND '
    querystring += 'protein < ? AND '
    querystring += 'name LIKE ?'

    where(querystring, fat_low, fat_high, carbohydrates_low, carbohydrates_high, protein_low, protein_high, "%#{recipe_name}%")
    # where('fat BETWEEN ? AND ? AND carbohydrates BETWEEN ? AND ? AND protein BETWEEN ? AND ? AND name LIKE ?', fat_low, fat_high, carbohydrates_low, carbohydrates_high, protein_low, protein_high, "%#{recipe_name}%")
    
  end

end
