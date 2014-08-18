class Recipe < ActiveRecord::Base
  DIFFICULTY=%w(Easy Medium Hard)
  TYPE=%w(Breakfast BBQ Protien\ Powder)
  PREFERENCE=%w(Gluten\ Free Dairy\ Free Low\ Fat High\ Protein)
  CUISINE=%w(Asian Mediterranean Italian)

  def name=(value)
    write_attribute(:name, value.downcase)
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search.downcase}%")
    else
      all
    end
  end

end
