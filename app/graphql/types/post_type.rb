class Types::PostType < Types::BaseObject
  description "A Post"

  field :id, ID, null: false
  field :title, String, null: false
  field :body, String, null: false
  field :comments, [Types::CommentType], null: true
  field :created_at, String, null: false
  field :slug, String, null: false
  field :avatar_url, String, null: false
  field :avatar_thumbnail, String, null: false

  def comments
    object.comments
  end

  def avatar_url
    Rails.application.routes.url_helpers.rails_blob_url(object.avatar, only_path: true)
  end

  def avatar_thumbnail
    Rails.application.routes.url_helpers.polymorphic_url(object.avatar_thumbnail, only_path: true)
  end

end