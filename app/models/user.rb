# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  fName      :string(255)
#  lName      :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :fName, :lName
end