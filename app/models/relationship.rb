# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  adder_id   :integer
#  friend_id  :integer
#  accept     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Relationship < ActiveRecord::Base
attr_accessible :friend_id

  belongs_to :adder, class_name: "User"
  belongs_to :friend, class_name: "User"

  validates :adder_id, presence: true
  validates :friend_id, presence: true
end
