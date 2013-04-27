# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  accept     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Relationship do
  pending "add some examples to (or delete) #{__FILE__}"
end
