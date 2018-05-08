class User < ApplicationRecord

  before_save { self.email = email.downcase }

  scope :ordered_by_username, -> { order(username: :asc) }

  has_secure_password

  validates :password,
    presence: { on: :create },
    length: { minimum: 8, allow_blank: false }

  validates :username,
    presence: true,
    length: { minimum: 2 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, length: {maximum: 30},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  has_many :posts, dependent: :destroy

end

