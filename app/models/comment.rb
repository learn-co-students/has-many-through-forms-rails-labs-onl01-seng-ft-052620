class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['username'].blank? }

  before_validation :find_or_create_user

  def find_or_create_user
    if user = User.find_by(username: self.user.username)
      self.user = user
    end
  end

end
