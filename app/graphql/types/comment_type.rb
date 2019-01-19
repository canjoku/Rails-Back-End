class Types::CommentType < Types::BaseObject

  description "A Comment"

  field :id, ID, null: false
  field :body, String, null: false
  field :post, Types::PostType, null: false
  field :created_at, String, null: false
  field :post_id, ID, null: false
end