# == Schema Information
#
# Table name: posts
#
#  id                :integer          not null, primary key
#  content           :string(255)
#  type              :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  wall_file_name    :string(255)
#  wall_content_type :string(255)
#  wall_file_size    :integer
#  wall_updated_at   :datetime
#  vid_file_name     :string(255)
#  vid_content_type  :string(255)
#  vid_file_size     :integer
#  vid_updated_at    :datetime
#

class Post < ActiveRecord::Base
  attr_accessible :content, :wall, :vid, :vid_file_name

  belongs_to :user

  validates :content, presence: true, length: { maximum: 150 }
  validates :user_id, presence: true
  default_scope order: 'posts.created_at DESC'
  has_attached_file :wall, :styles =>{ :fit => "300x300>" }
  has_attached_file :vid, :styles => {
    :medium => { :geometry => "608x342", :format => 'flv' },
    :thumb => { :geometry => "608x342#", :format => 'jpg', :time => 10 },
    :play => {:geometry => "400x300", :format => 'mp4', :streaming => true}
  }, :processors => [:ffmpeg]
  
 def self.from_users_friend_by(user)
    friend_user_ids = "SELECT friend_id FROM relationships
                         WHERE adder_id = :user_id"
    where("user_id IN (#{friend_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end

end
