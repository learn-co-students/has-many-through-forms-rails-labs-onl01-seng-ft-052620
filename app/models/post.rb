class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories, reject_if: proc { |attr| attr['name'].blank? }
  before_validation :find_or_create_category

  def find_or_create_category
    self.categories = self.categories.map do |category|
      Category.find_or_create_by(name: category.name)
    end
  end

  def comment_contents(user)
    comments = self.comments.where(user: user).map {|comment| comment.content}
    comments.join("; ")
  end

  def category_names
    comments = self.categories.map {|category| category.name}
    comments.join(", ")
  end


end
