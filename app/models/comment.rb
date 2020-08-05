class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

def user_attributes=(user_attribute)
 
      
  self.user =  User.find_or_create_by(username: user_attribute[:username]) unless user_attribute[:username].empty?
 
end
#user_attribute.each do |i, category_attribute|
#  unless category_attribute['name'].empty?
#category = Category.find_or_create_by(name: category_attribute[:name] )

end
