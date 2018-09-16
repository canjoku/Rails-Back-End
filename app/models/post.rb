class Post < ApplicationRecord
  scope :most_recent, -> { order(created_at: :desc) }
  scope :published, -> { where(status: "published") }
  scope :draft, -> { where(status: "draft") }

  after_update :publish_creation


  extend FriendlyId
  friendly_id :title, use: :slugged

  include Wisper::Publisher

  validates :title, presence: true
  validates :body, presence: true

  has_many :comments, dependent: :destroy

  private
  def publish_creation
    broadcast(:send_new_post_mail, self.id) if self.status == "publish"
  end

end