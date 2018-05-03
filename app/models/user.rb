class User < ApplicationRecord

  def self.default_scope
    order(username: :asc)
  end

  has_secure_password
  before_save { self.email = email.downcase }
  has_many :posts, dependent: :destroy
  validates :username, presence: true, length: {minimum: 2}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, length: {maximum: 200},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 8}, allow_nil: true

end

