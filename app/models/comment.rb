class Comment < ApplicationRecord
  include Wisper::Publisher
  after_save :publish_creation

  belongs_to :post

  validates :body, :name, presence: true

  private
  def publish_creation
    broadcast(:send_comment_mail, self.id)
  end

end
