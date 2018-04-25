class User < ApplicationRecord

  has_secure_password
  before_save { self.email = email.downcase }
  has_many :posts
  validates :username, presence: true, length: {minimum: 2}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, length: {maximum: 200},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

end

