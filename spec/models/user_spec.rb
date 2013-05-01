# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  fName            :string(255)
#  lName            :string(255)
#  email            :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  password_digest  :string(255)
#  remember_token   :string(255)
#  admin            :boolean          default(FALSE)
#  pic_file_name    :string(255)
#  pic_content_type :string(255)
#  pic_file_size    :integer
#  pic_updated_at   :datetime
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
