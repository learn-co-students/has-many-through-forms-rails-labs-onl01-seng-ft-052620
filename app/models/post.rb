class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def category_ids=(ids_ary)
    ids_ary.each do |id|
      unless id.empty?
        c = Category.find(id) 
        self.categories << c 
      end
    end
  end

  def categories_attributes=(attributes_hash)
    unless attributes_hash["0"]["name"].empty?
      category = Category.find_or_create_by(attributes_hash["0"])
      self.categories << category
    end
  end
end
