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
#

require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"
end
