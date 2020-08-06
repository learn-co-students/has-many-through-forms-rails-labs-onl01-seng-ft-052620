class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user, reject_if: :reject_user

  def user_attributes(user_attributes)
    user_attributes.values.each do |attr|
      user = User.find_or_create_by(attr)
      self.user = user
    end
  end

  def user_username
    self.user ? self.user.username : nil
  end

  private 

  def reject_user(attributes)
    attributes[:username].blank?
  end
end
