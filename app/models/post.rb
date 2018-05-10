class Post < ApplicationRecord

  scope :most_recent, -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :description, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
  validates :banner_image_url, presence: true
  belongs_to :user

end