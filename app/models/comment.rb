class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user 

  def user_attributes=(user_attributes)
    user_attributes.values.each do |user_attribute|
      self.user = User.find_or_create_by(username: user_attribute) unless user_attribute.blank?
    end
  end

end
