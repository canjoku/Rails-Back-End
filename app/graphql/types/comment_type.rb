class Types::CommentType < Types::BaseObject

  description "A Comment"

  field :id, ID, null: false
  field :body, String, null: true
  field :post, Types::PostType, null: false
end