class Post < ApplicationRecord

  scope :most_recent, -> { order(id: :desc) }

  validates :title, presence: true
  validates :description, presence: true, length: {minimum: 5, maximum: 1200}
  validates :body, presence: true, length: {minimum: 10, maximum: 5000}
  validates :user_id, presence: true
  validates :banner_image_url, presence: true
  belongs_to :user

end