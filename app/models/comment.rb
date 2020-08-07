class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user_attributes)
    user_attributes.values.each do |user_attribute|
      self.user = User.find_or_create_by(username: user_attributes[:username]) unless user_attributes[:username].blank?
    end
  end
end
