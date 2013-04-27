# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  type       :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user

  validates :content, presence: true, length: { maximum: 150 }
  validates :user_id, presence: true
  default_scope order: 'posts.created_at DESC'
  
 def self.from_users_friend_by(user)
    friend_user_ids = "SELECT friend_id FROM relationships
                         WHERE adder_id = :user_id"
    where("user_id IN (#{friend_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end

end
