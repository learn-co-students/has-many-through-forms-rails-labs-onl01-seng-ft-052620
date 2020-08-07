class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  # accepts_nested_attributes_for :categories

  def categories_attributes=(categories_hashes)
    # {"0"=>{"name"=>"something 100"}, "1"=>{"name"=>"something 101"}}
    # this is what categories_hashes looks like. Keys are indexed [0], [1]
    # inner hashes ({"name"=>"something 100"}) represent category hash

    # raise categories_hashes.inspect
      categories_hashes.each do |index, category_attributes|
        if category_attributes[:name].present?
          category = Category.find_or_create_by(name: category_attributes[:name])
          if !self.categories.include?(category)
            # self.categories << category
            self.post_categories.build(:category => category)
          end
        end
    end
  end

end
