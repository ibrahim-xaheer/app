# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  fName           :string(255)
#  lName           :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

#  == Schema Information
#
#  Table name: users
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

  attr_accessible :fName, :lName, :email, :password, :password_confirmation
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :relationships, foreign_key: "adder_id", dependent: :destroy
  has_many :friend_users, through: :relationships, source: :friend
  has_many :reverse_relationships, foreign_key: "friend_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :adders, through: :reverse_relationships, source: :adder

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :fName, presence: true, length: { maximum: 50 }
  validates :lName, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def feed
    Post.where("user_id = ?", id)
  end

  def friends_added?(other_user)#########################use to show friends All Later
    relationships.find_by_friend_id(other_user.id)
  end

  def make_friend!(other_user)
    relationships.create!(friend_id: other_user.id)
  end

  def unfriend!(other_user)
    relationships.find_by_friend_id(other_user.id).destroy
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
