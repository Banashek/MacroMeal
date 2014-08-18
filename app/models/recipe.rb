class Recipe < ActiveRecord::Base
  DIFFICULTY=%w(Easy Medium Hard)

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
