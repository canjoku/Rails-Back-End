class Post < ApplicationRecord
  scope :most_recent, -> { order(created_at: :desc) }
  scope :published, -> { where(status: "published") }
  scope :draft, -> { where(status: "draft") }

  after_save :publish_notification if :published?

  extend FriendlyId
  friendly_id :title, use: :slugged

  include Wisper::Publisher

  validates :title, :body, :avatar, presence: true

  has_many :comments, dependent: :destroy

  has_one_attached :avatar

  def avatar_thumbnail
    self.avatar.variant(resize: '400x400')
  end

  private

  def publish_notification
    broadcast(:send_new_post_notification)
  end

  def published?
    self.status == "published"
  end


end
