class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  def user_attributes=(attributes_hash)
    self.user = User.find_or_create_by(attributes_hash) unless attributes_hash[:username].empty?
  end

  def username
  end

  def username=(username)
    self.user = User.find_or_create_by(username: username) unless username.empty?
  end
end
