# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  fName              :string(255)
#  lName              :string(255)
#  email              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string(255)
#

class User < ActiveRecord::Base

  attr_accessible :email, :fName, :lName, :password, :password_confirmation
  attr_accessor	  :password

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z\d\-.]+\z/i

  validates :fName,  presence: true, length: { maximum: 50 }
  validates :lName,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, 
  					format: { with: email_regex },
                    uniqueness: true
  validates :password, presence: true,
  					   confirmation: true,
  					   length: {within: 6..40}


end
